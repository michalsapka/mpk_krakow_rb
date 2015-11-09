module MpkKrakowRb
  class Line
    attr_reader :number, :type

    def initialize(type:, number:)
      @type = type
      @number = number
      @fetcher = MpkKrakowRb::Fetchers::StopsForLine.new(@number)
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
      @fetcher.fetch.each do |stop|
        stops << stop
      end
      stops
    end
  end
end
