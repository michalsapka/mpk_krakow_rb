module MpkKrakowRb
  class LineStop < Stop
    def initialize(stop:, line:, line_position:)
      @line = line
      @line_position = line_position
      super(id: stop.id, name: stop.name, lines_list: stop.lines_list)
    end
  end
end

