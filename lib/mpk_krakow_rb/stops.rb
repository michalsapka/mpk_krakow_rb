module MpkKrakowRb
  class Stops
    include Enumerable
    def initialize(lines_list:)
      @fetcher = Fetchers::Stops.new
      @stops = []
      @lines_list = lines_list
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
      @fetcher.fetch.each do |stop|
        @stops << Stop.new(id: stop[:id], name: stop[:name], lines_list: @lines_list)
      end
    end
  end
end
