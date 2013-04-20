require 'spec_helper'

describe Timer do
  subject(:timer) { Timer.new(5) }

  describe "#new" do
    its(:duration) { should == 5 }
    its(:current) { should == 0 }
    its(:state) { should be :idle }
    its(:done?) { should be_false }

    it { should respond_to(:start) }
  end

  describe "#start" do
    before(:each) do
      thread = Thread.new do
        timer.start
      end
    end

    its(:state) { should eq :running }
  end

  describe "completion" do
    before(:each) do
      timer.interval_duration = 0
      timer.start
    end

    its(:done?) { should be_true }
  end
end