if defined?(ActiveSupport::TimeWithZone)
  class ActiveSupport::TimeWithZone
    TimeClock::BusinessTimeUntil
  end
end