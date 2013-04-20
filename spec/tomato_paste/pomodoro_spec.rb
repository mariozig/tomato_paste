require 'spec_helper'

describe TomatoPaste::Pomodoro do
  subject(:pomodoro) { described_class.new("I'm just sitting here testing") }

  describe "#new" do
    its(:description) { should == "I'm just sitting here testing" }
    its(:work_timer) { should be_a_kind_of(TomatoPaste::Timer) }
    its(:break_timer) { should be_a_kind_of(TomatoPaste::Timer) }
    its(:state) { should eq :unstarted }

    it "should be set for 25 minutes (1500 seconds) of work" do
      pomodoro.work_timer.duration.should == 1500
    end

    it "should be set for 5 minutes (300 seconds) of break" do
      pomodoro.break_timer.duration.should == 300
    end
  end

end