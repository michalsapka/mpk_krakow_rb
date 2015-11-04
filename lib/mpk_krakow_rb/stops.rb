module MpkKrakowRb
  class Stops
    include Enumerable
    Url = "http://rozklady.mpk.krakow.pl/aktualne/przystan.htm"
    Parser = /<li><a href=\\"p\/p(?<id>\d*).htm\\">(?<name>.*)<\/a><\/li>/
      def initialize
        @stops = []
        get_stops
      end

      def each
        return to_enum(__callee__) unless block_given?
        0.step.each do |index|
          item = @stops[index] or break
          yield item
        end
      end

      private

      def get_stops
        doc = Nokogiri::HTML(open(Url))
        doc.xpath("//li").each do |stop|
          parsed = stop.to_s.match(/<li><a href=\"p\/p(?<id>\d*).htm\">(?<name>.*)<\/a><\/li>/i)
          @stops << Stop.new(id: parsed["id"], name: parsed["name"].encode("UTF-8"))
        end
      end
  end
end
