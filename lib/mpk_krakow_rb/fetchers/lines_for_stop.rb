module MpkKrakowRb
  module Fetchers
    class LinesOnStop
      def initialize(id)
        @id = id.to_s.rjust(4, "0")
        @url = "http://rozklady.mpk.krakow.pl/aktualne/p/p#{@id}.htm"
        @pattern = /\/(\d+)\/\d/
      end

      def fetch
        lines = []
        @doc = get_content
        @doc.scan(@pattern) do |line|
          lines << line.first.to_i
        end
        lines.uniq
      end

      private

      def get_content
        Net::HTTP.get(URI(@url), &:read)
      end
    end
  end
end
