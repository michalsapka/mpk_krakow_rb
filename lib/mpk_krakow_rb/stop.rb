module MpkKrakowRb
  class Stop
    attr_reader :name, :id, :lines_list

    def initialize(id:, name:, lines_list:)
      @id = id.to_i
      @name = name
      @fetcher = Fetchers::LinesOnStop.new(@id)
      @lines_list = lines_list
    end

    def lines
      @lines || get_lines
    end

    def to_s
      "Stop: #{name}"
    end

    def inspect
      "#<MpkKrakowRb::Stop:#{object_id} #{@name}>"
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
