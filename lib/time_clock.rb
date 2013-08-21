require "time_clock/version"

require "time_clock/core_ext/time"

require "time_clock/shift"
require "time_clock/calendar"
require "time_clock/comparison"

module TimeClock

  def self.default_calendar=(value)
    @default_calendar = value
  end

  def self.default_calendar
    @default_calendar
  end

end
