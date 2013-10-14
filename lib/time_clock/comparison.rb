module TimeClock
  class Comparison

    class NilCalendarError < ArgumentError; end

    attr_reader :start_time, :end_time, :calendar

    def initialize(start_time, end_time, calendar=TimeClock.default_calendar)
      raise NilCalendarError unless calendar
      @start_time, @end_time, @calendar = start_time.to_time, end_time.to_time, calendar
    end

    def period
      @period ||= Shift.new(earlier_time, later_time)
    end

    def seconds
      calendar.shifts.inject(0) do |total_seconds, shift|
        total_seconds + period.overlapping_seconds(shift)
      end
    end

  private

    def earlier_time
      start_time < end_time ? start_time : end_time
    end

    def later_time
      end_time > start_time ? end_time : start_time
    end

  end
end