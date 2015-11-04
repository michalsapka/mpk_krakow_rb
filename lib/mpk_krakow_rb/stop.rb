module MpkKrakowRb
  class Stop
    attr_accessor :id, :name

    def initialize(id:, name:)
      @id = id
      @name =name
      @url = "http://rozklady.mpk.krakow.pl/aktualne/p/p#{id}.htm"
    end

    def lines
      @lines ||= get_lines 
    end

    def get_lines
      lines = []
      @doc = Nokogiri::HTML(open(@url))
      @doc.
        to_s.
        scan(/>(\d*)\s/).
        map{ |i| i.first.to_i }.
        reject(&:zero?).
        uniq.
        each do |line|
          lines << line
        end
        lines
    end
  end
end
