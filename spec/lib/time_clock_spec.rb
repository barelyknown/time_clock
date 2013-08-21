require 'spec_helper'

describe TimeClock do
  let(:default_calendar) { TimeClock::Calendar.new }
  it "should set a default calendar" do
    described_class.default_calendar = default_calendar
    expect(described_class.default_calendar).to eq default_calendar
  end
end