module MpkKrakowRb
  module Fetchers
    class Stops
      def initialize
        @url = "http://rozklady.mpk.krakow.pl/aktualne/przystan.htm"
        @parser = /p(?<id>\d+).htm\W+(?<name>[^<]*)/ 
      end

      def fetch
        stops = []
        @doc = get_content
        @doc.scan(@parser).each do |stop|
          stops << { id: stop[0], name: stop[1].encode("UTF-8")}
        end
        stops.uniq
      end

      def get_content
        Net::HTTP.get_response(URI(@url)).body.force_encoding("ISO-8859-2")
      end

    end
  end
end
