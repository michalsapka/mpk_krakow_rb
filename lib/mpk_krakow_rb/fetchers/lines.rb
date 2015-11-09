module MpkKrakowRb
  module Fetchers
    class Lines
      def initialize
        @url = "http://rozklady.mpk.krakow.pl/linie.aspx"
        @type_parser =/linie (\w*)(.*?)table/i
        @line_parser = /(\d*)rw/
        @lines = []
      end

      def fetch
        data = get_content.gsub("\n", '')
        data.scan(@type_parser).each do |type|
          line_type = line_type(type[0])
          find_lines(type[1]).each do |line|
            @lines << { type: line_type, number: line.first.to_i }
          end
        end
        @lines
      end

      private

      def get_content
        Net::HTTP.get_response(URI(@url)).body
      end

      def find_lines(string)
        string.scan(@line_parser)
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
end
