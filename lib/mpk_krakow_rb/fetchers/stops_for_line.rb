module MpkKrakowRb
  module Fetchers
    class StopsForLine
      def initialize(number)
        @number = number
        @url = "http://rozklady.mpk.krakow.pl/aktualne/#{number_as_string}/#{number_as_string}w001.htm"
        @parser = /R\">(?:<b>)?([^<]+)/
      end

      def fetch
        stops = []
        @doc = get_content
        @doc.scan(@parser).each do |stop|
          stops << stop.first.encode("UTF-8").gsub(/(^\s*|\s*NŻ$|\s*$)/, "")
        end
        stops
      end

      private

      def get_content
        Net::HTTP.get_response(URI(@url)).body.force_encoding("ISO-8859-2")
      end

      def number_as_string
        @number.to_s.rjust(4,"0")
      end
    end
  end
end
