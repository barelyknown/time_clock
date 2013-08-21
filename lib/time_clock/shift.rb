module TimeClock
  class Shift

    class EndTimeAfterStartTimeError < ArgumentError; end

    attr_reader :start_time, :end_time

    def initialize(start_time, end_time)
      raise EndTimeAfterStartTimeError unless end_time > start_time
      @start_time, @end_time = start_time, end_time
    end

    def overlaps?(shift)
      start_time <= shift.end_time && end_time >= shift.start_time
    end

    def overlapping_seconds(shift)
      [[end_time,shift.end_time].min - [start_time,shift.start_time].max,0].max
    end

    def ==(value)
      start_time == value.start_time && end_time == value.end_time
    end

  end
end