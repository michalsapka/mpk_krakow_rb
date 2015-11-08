module MpkKrakowRb
  class Stop
    def initialize(id:, name:, lines_list:)
      @id = id
      @name =name
      @fetcher = Fetchers::LinesOnStop.new("http://rozklady.mpk.krakow.pl/aktualne/p/p#{id}.htm")
      @lines_list = lines_list
    end

    def lines
      @lines || get_lines
    end

    private

    def get_lines
      @fetcher.fetch.each do |line|
        (@lines ||= []) << @lines_list.get(line)
      end
      @lines
    end
  end
end
