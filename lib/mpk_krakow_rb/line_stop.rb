module MpkKrakowRb
  class LineStop < Stop
    def initialize(id:, name:, lines_list:, line_number:, line_position:)
      @line = line_number
      @line_position = line_position
      super(id: id, name: name, lines_list: lines_list)
    end

    def inspect
      "#<MpkKrakowRb::LineStop:#{object_id} #{@name}>"
    end
  end
end
