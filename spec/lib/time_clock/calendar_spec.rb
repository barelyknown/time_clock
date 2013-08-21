require 'spec_helper'

module TimeClock
  describe Calendar do

    let(:base_shift) { Shift.new(Time.new(2013,8,19,6,0),Time.new(2013,8,19,18,0)) }

    it "should have an array of shifts" do
      expect(subject.shifts).to be_a_kind_of Array
    end

    context "with an empty array of shifts" do
      it "should add a shift to the array" do
        subject.add_shift(base_shift)
        expect(subject.shifts).to include base_shift
      end
    end

    context "after the base shift is added" do
      before do
        subject.add_shift(base_shift)
      end

      context "when adding a shift that should come before" do
        let(:new_shift) { Shift.new(Time.new(2013,8,18,6,0),Time.new(2013,8,18,18)) }
        it "adds it to the beginning" do
          subject.add_shift(new_shift)
          expect(subject.shifts.first).to eq new_shift
        end
      end

      context "when adding a shift that should come after" do
        let(:new_shift) { Shift.new(Time.new(2013,8,20,6,0),Time.new(2013,8,20,18,0))}
        it "adds it to the end" do
          subject.add_shift(new_shift)
          expect(subject.shifts.last).to eq new_shift
        end
      end

      context "when adding a shift that overlaps" do
        let(:new_shift) { Shift.new(Time.new(2013,8,19,8),Time.new(2013,8,19,15)) }
        it "should raise an error" do
          expect{subject.add_shift(new_shift)}.to raise_error Calendar::OverlappingShiftError
        end
      end

    end

  end
end