module TimeClock
  class Calendar
    class OverlappingShiftError < ArgumentError; end

    attr_reader :shifts

    def initialize
      @shifts = []
    end

    def add_shift(new_shift)
      starting_shift_count = @shifts.size
      shifts.each_with_index do |shift, index|
        raise OverlappingShiftError if new_shift.overlaps?(shift)
        break shifts.insert(index, new_shift) if shift.start_time > new_shift.end_time
      end
      shifts << new_shift unless shifts.size > starting_shift_count
      shifts
    end

  end
end