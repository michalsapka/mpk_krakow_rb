module MpkKrakowRb
  class Stop
    def initialize(id:, name:)
      @id = id
      @name =name
      @fetcher = Fetchers::LinesOnStop.new("http://rozklady.mpk.krakow.pl/aktualne/p/p#{id}.htm")
    end

    def lines
      @lines || get_lines
    end

    private

    def get_lines
      @fetcher.fetch.each do |line|
        (@lines ||= []) << line
      end
      @lines
    end
  end
end
