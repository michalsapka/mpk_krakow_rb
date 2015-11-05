module MpkKrakowRb
  module Fetchers
    class LinesOnStop
      def initialize(url)
        @url = url
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
