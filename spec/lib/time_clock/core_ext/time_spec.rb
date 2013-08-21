require 'spec_helper'

describe Time do
  subject { Time.new(2013,8,13,14,15) }

  it "should respond to #seconds_until" do
    expect(subject).to respond_to :business_seconds_until
  end

end