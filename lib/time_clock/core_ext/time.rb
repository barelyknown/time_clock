class Time

  def business_seconds_until(time)
    TimeClock::Comparison.new(self, time).seconds.to_i
  end

  def business_minutes_until(time)
    (business_seconds_until(time).to_f / 60).ceil
  end

  def business_hours_until(time)
    (business_seconds_until(time).to_f / 3600).ceil
  end

end