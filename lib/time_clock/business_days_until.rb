module TimeClock
  module BusinessDaysUntil

    def business_days_until(date)
      TimeClock::Comparison.new(self, date).days
    end

  end
end
