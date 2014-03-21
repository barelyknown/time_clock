module TimeClock
  class Comparison

    class NilCalendarError < ArgumentError; end

    attr_reader :start_time, :end_time, :calendar

    def initialize(start_time, end_time, calendar=TimeClock.default_calendar)
      raise NilCalendarError unless calendar
      @start_time = start_time.to_time
      @end_time = end_time_from_value(end_time)
      @calendar = calendar
    end

    def period
      @period ||= Shift.new(earlier_time, later_time)
    end

    def seconds
      calendar.shifts.inject(0) do |total_seconds, shift|
        total_seconds + period.overlapping_seconds(shift)
      end
    end

    def days
      dates = Set.new
      calendar.shifts.each do |shift|
        if period.overlapping_seconds(shift) > 0
          dates.add shift.start_time.to_date
          dates.add shift.end_time.to_date
        end
      end
      dates.size
    end

  private

    def end_time_from_value(value)
      case value
      when Time, ActiveSupport::TimeWithZone
        value.to_time
      when Date
        (value + 1).to_time
      end
    end

    def earlier_time
      start_time < end_time ? start_time : end_time
    end

    def later_time
      end_time > start_time ? end_time : start_time
    end

  end
end
