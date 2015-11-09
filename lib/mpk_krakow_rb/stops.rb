module MpkKrakowRb
  class Stops
    include Enumerable

    attr_accessor :lines_list

    def initialize(lines_list:nil)
      @fetcher = Fetchers::Stops.new
      @stops = []
      @lines_list = lines_list
    end

    def inspect
      "#<MpkKrakowRb::Stops:#{object_id}"
    end

    def each
      return to_enum(__callee__) unless block_given?
      0.step.each do |index|
        item = @stops[index] or break
        yield item
      end
    end

    def get(stop_name)
      @stops.detect{ |s| s.name == stop_name } or "Stop not found"
    end

    def get_stops
      @fetcher.fetch.each do |stop|
        @stops << Stop.new(id: stop[:id], name: stop[:name], lines_list: @lines_list)
      end
    end
  end
end
