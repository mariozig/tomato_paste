require 'spec_helper'

describe Timer do
  subject(:timer) { Timer.new(100) }

  describe "#new" do
    its(:duration) { should == 100 }
    its(:start_time) { should be_nil }
    its(:current_time) { should be_nil }
    its(:end_time) { should be_nil }
    its(:state) { should be :idle }
    its(:done?) { should be_false }

    it { should respond_to(:start) }
  end

  describe "#start" do
    before(:each) do
      Timecop.freeze
      timer.start
    end

    its(:state) { should be :running }
    its(:start_time) { should == Time.now }
    its(:end_time) { should == Time.now + timer.duration }
  end

  describe "#done?" do
    before(:each) do
      Timecop.freeze
      timer.start
      Timecop.travel(Time.now + timer.duration)
    end

    its(:done?) { should be_true }
  end
end