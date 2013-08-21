require 'spec_helper'

module TimeClock
  describe Shift do

    let(:start_time) { Time.new(2013,8,19,6,0) }
    let(:end_time) { Time.new(2013,8,19,18,0) }

    subject do
      described_class.new(start_time, end_time)
    end

    it "should set the start time" do
      expect(subject.start_time).to eq start_time
    end

    it "should set the end time" do
      expect(subject.end_time).to eq end_time
    end

    it "should raise the right exception if the end time is before the start time" do
      expect{described_class.new(end_time, start_time)}.to raise_error Shift::EndTimeAfterStartTimeError
    end

    it "should be eq if the times are equal" do
      expect(subject).to eq subject.dup
    end

    context "when evaluating overlaps" do
      let(:overlapping_shift) { Shift.new(Time.new(2013,8,19,5), Time.new(2013,8,19,10)) }
      let(:non_overlapping_shift) { Shift.new(Time.new(2013,8,18,5), Time.new(2013,8,18,10)) }
      it "should know when it does" do
        expect(overlapping_shift.overlaps?(subject)).to be_true
      end
      it "should know when it doesn't" do
        expect(non_overlapping_shift.overlaps?(subject)).to_not be_true
      end
      it "should calculate the overlapping seconds when there is an overlap" do
        expect(overlapping_shift.overlapping_seconds(subject)).to eq 4 * 60 * 60
      end
      it "should calculate the overlapping seconds when there isn't an overlap" do
        expect(non_overlapping_shift.overlapping_seconds(subject)).to eq 0
      end
    end


  end
end