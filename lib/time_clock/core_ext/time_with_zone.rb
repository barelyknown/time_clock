if defined?(ActiveSupport::TimeWithZone)
  class ActiveSupport::TimeWithZone
    include TimeClock::BusinessTimeUntil
  end
end