require 'spec_helper'

describe Time do
  subject { Time.new(2013,8,13,14,15) }
  let(:end_time) { Time.new(2013,8,13,14,18) }

  it "should calculate business_seconds_until" do
    comparison = double("comparison", seconds: 3)
    expect(TimeClock::Comparison).to receive(:new).with(subject, end_time).and_return(comparison)
    expect(subject.business_seconds_until(end_time)).to eq comparison.seconds
  end

  it "should calculate business minutes until" do
    expect_any_instance_of(Time).to receive(:business_seconds_until).and_return(60)
    expect(subject.business_minutes_until(end_time)).to eq 1
  end

  it "should calculate business hours until" do
    expect_any_instance_of(Time).to receive(:business_seconds_until).and_return(3500)
    expect(subject.business_hours_until(end_time)).to eq 1
  end

end
