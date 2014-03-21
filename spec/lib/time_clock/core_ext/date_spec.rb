require 'spec_helper'

describe Date do
  subject { Date.new(2013,8,13) }
  let(:end_date) { Date.new(2013,8,14) }

  it "should calculate business_seconds_until" do
    comparison = double("comparison", days: 3)
    expect(TimeClock::Comparison).to receive(:new).with(subject, end_date).and_return(comparison)
    expect(subject.business_days_until(end_date)).to eq comparison.days
  end

end
