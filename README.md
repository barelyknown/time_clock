# TimeClock

Calculate the amount of business time between two times based on any arbitrary work calendar.

    gem 'time_clock'

Once you've set a default calendar, any `Time` instance will have a few helpful methods.

    Time.now.business_seconds_until(Time.now + 1.day)
    => 43200
    Time.now.business_minutes_until(Time.now + 1.day)
    => 720
    Time.now.business_hours_until(Time.now + 1.day)
    => 12

You can also make custom calendars for each calculation (see Calendars section for details).

**Things you may like about this library:**

- No dependencies.
- Extremely simple codebase. Only 80 lines of code.
- Works with any kind of `Time`, including mixed types.
- Easy to customize with totally custom business calendars.
- [![Code Climate](https://codeclimate.com/repos/5214185789af7e04ce021d7b/badges/ebf8537627c6cc30178c/gpa.png)](https://codeclimate.com/repos/5214185789af7e04ce021d7b/feed)

## Configuration

Set a `default_calendar` for all comparisons to use for their calculation.

For example, in a Rails initializer:

    # Time zones aren't required. Used here to make it easier to read.
    time_zone = ActiveSupport::TimeZone.new("America/Chicago")

    # The TimeClock::Calendar object stores the shifts for the business calendar.
    calendar = TimeClock::Calendar.new

    # Add all the work days (or individual shifts) to the calendar
    # This example adds non week days between 6am and 6pm.
    (Date.new(2011,1,1)..Date.new(2015,1,1)).each do |date|
      next unless (1..5).cover?(date.wday)
      calendar.add_shift(
        TimeClock::Shift.new(
          time_zone.local(date.year,date.month,date.day,6),
          time_zone.local(date.year,date.month,date.day,18),
        )
      )
    end

    # Set the default calendar
    TimeClock.default_calendar = calendar

## Calendars

If you want to use a separate calendar for an individual calculation, use a `TimeClock::Comparison` instance. Refer back to the configuration example to understand how to build a calendar.

    TimeClock::Comparison.new(Time.now, Time.now + 1.day, custom_calendar).seconds

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
