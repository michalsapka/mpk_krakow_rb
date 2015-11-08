module MpkKrakowRb
  class Lines
    include Enumerable
    def initialize
      @lines = []
      @url = "http://rozklady.mpk.krakow.pl/linie.aspx"
      @type_parser =/linie (\w*)(.*?)table/i
      get_lines
    end

    def get(line_number)
      @lines.detect{ |line| line.number == line_number } or "Line not found"
    end

    def each
      return to_enum(__callee__) unless block_given?
      0.step.each do |index|
        item = @lines[index] or break
        yield item
      end
    end

    private

    def get_lines
      data = Net::HTTP.get_response(URI(@url)).body
      data = data.gsub("\n", '')
       data.scan(@type_parser).each do |type|
        line_type = line_type(type[0])
        type[1].scan(/(\d*)rw/).each do |line|
           @lines << Line.new(type: line_type, number: line.first.to_i)
        end
      end
    end

    def line_type(polish_string)
      case polish_string
      when /tramwaj/ then :tram
      when /autobus/ then :bus
      when /aglom/ then :agglomeration
      end
    end
  end
end
