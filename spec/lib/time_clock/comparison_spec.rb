require 'spec_helper'

module TimeClock
  describe Comparison do

    let(:start_time) { Time.now }
    let(:end_time) { Time.now + 3600 }
    let(:calendar) { Calendar.new }

    subject do
      described_class.new(start_time, end_time, calendar)
    end

    it "should set the start time" do
      expect(subject.start_time).to eq start_time
    end

    it "should set the end time" do
      expect(subject.end_time).to eq end_time
    end

    it "should set the calendar" do
      expect(subject.calendar).to eq calendar
    end

    it "should create a period" do
      expect(subject.period).to eq Shift.new(start_time, end_time)
    end

    context "when the start time is after the end time" do
      let(:start_time) { Time.now + 3600 }
      let(:end_time) { Time.now }
      it "should create a shift with flipped around times" do
        expect(subject.period).to eq Shift.new(end_time, start_time)
      end
    end

    context "when calculating seconds between" do
      let(:calendar) do
        Calendar.new.tap do |c|
          c.add_shift(Shift.new(Time.new(2013,8,19,6),Time.new(2013,8,19,18)))
          c.add_shift(Shift.new(Time.new(2013,8,20,6),Time.new(2013,8,20,18)))
          c.add_shift(Shift.new(Time.new(2013,8,21,6),Time.new(2013,8,21,18)))
          c.add_shift(Shift.new(Time.new(2013,8,23,6),Time.new(2013,8,23,18)))
        end
      end
      context "when the times are within one shift" do
        let(:start_time) { Time.new(2013,8,20,10) }
        let(:end_time) { Time.new(2013,8,20,14) }
        subject do
          described_class.new(start_time, end_time, calendar)
        end
        it "should calculate seconds between" do
          expect(subject.seconds).to eq 60 * 60 * 4
        end
      end
    end

  end
end