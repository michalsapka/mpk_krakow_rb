module MpkKrakowRb
  class Lines
    include Enumerable

    attr_accessor :stops_list

    def initialize(stops_list: nil)
      @lines = []
      @fetcher = MpkKrakowRb::Fetchers::Lines.new
      @stops_list = stops_list
    end

    def get(line_number)
      @lines.detect { |line| line.number == line_number } or 'Line not found'
    end

    def each
      return to_enum(__callee__) unless block_given?
      0.step.each do |index|
        item = @lines[index] or break
        yield item
      end
    end

    def inspect
      "#<MpkKrakowRb::Lines:#{object_id}>"
    end

    def get_lines
      data = @fetcher.fetch
      data.each do |line|
        @lines << Line.new(type: line[:type],
                           number: line[:number],
                           stops_list: @stops_list)
      end
    end
  end
end
