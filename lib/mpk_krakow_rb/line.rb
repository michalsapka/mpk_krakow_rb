module MpkKrakowRb
  class Line
    attr_reader :number, :type

    def initialize(type:, number:, stops_list:)
      @stops_list = stops_list
      @type = type
      @number = number
      @fetcher_one = MpkKrakowRb::Fetchers::StopsForLine.new(@number, 1)
      @fetcher_two = MpkKrakowRb::Fetchers::StopsForLine.new(@number, 2)
    end

    def to_s
      "#{@type.to_s.upcase} line: #{@number}"
    end

    def inspect
      "#<MpkKrakowRb::Line:#{object_id} #{@number}>"
    end

    def stops
      @stops ||= get_stops
    end

    private

    def get_stops
      stops = []
      index = 0
      @fetcher_one.fetch.each do |stop|
        index += 1
        stop = @stops_list.get(stop)
        stops << LineStop.new(id: stop.id,
                              name: stop.name,
                              line_number: @number,
                              lines_list: stop.lines_list,
                              line_position: index)
      end

      @fetcher_two.fetch.each do |stop|
        index += 1
        stop = @stops_list.get(stop)
        stops << LineStop.new(id: stop.id,
                              name: stop.name,
                              line_number: @number,
                              lines_list: stop.lines_list,
                              line_position: index)
      end
      stops
    end
  end
end
