module MpkKrakowRb
  class Line
    attr_reader :number, :type

    def initialize(type:, number:)
      @type = type
      @number = number
    end

    def to_s
      "#{@type.to_s.upcase} line: #{@number}"
    end

    def inspect
      "#<MpkKrakowRb::Stop:#{object_id} #{@number}>"
    end
  end
end
