if defined?(ActiveSupport::TimeWithZone)
  ActiveSupport::TimeWithZone.include(TimeClock::BusinessTimeUntil)  
end