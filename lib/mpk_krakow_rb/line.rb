module MpkKrakowRb
  class Line
    attr_reader :number, :type

    def initialize(type:, number:)
      @type = type
      @number = number
    end

    def to_s
      "#{@type.to_s.upcase} line: #{@number}"
    end

    def inspect
      "#<MpkKrakowRb::Line:#{object_id} #{@number}>"
    end

    def stops
      @stops ||= get_stops
    end

    private

    def get_stops
      stops = []
      @url = "http://rozklady.mpk.krakow.pl/aktualne/#{number_as_string}/#{number_as_string}w001.htm"
      data = Net::HTTP.get_response(URI(@url)).body.force_encoding("ISO-8859-2")
      data.scan(/R\">(?:<b>)?([^<]+)/).each do |stop|
        stops << stop.first.encode("UTF-8").gsub(/(^\s*|\s*NŻ$|\s*$)/, "")
      end
      stops 
    end

    def number_as_string
      @number.to_s.rjust(4,"0")
    end
  end
end
