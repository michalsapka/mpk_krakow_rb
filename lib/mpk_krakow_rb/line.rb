module MpkKrakowRb
  class Line
    attr_reader :number, :type

    def initialize(type:, number:)
      @type = type
      @number = number
    end
  end
end
