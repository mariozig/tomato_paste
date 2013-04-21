require 'spec_helper'

describe TomatoPaste::Vine do
  subject(:vine) { described_class.new }

  describe "#new" do
    its(:pomodori) { should be_empty }
  end

  describe "#add" do
    let(:pomodoro) { TomatoPaste::Pomodoro.new("Hang on little tomato") } # https://www.youtube.com/watch?v=9Jz706sJMjg

    before(:each) do
      vine.add(pomodoro)
    end

    it { should have_exactly(1).pomodori }
  end

  describe "#big_break_time?" do
    before(:each) do
      4.times do |n|
        vine.add(TomatoPaste::Pomodoro.new("Hang on little tomato #{n}"))
      end
    end

    it "should be true every 4 pomodori" do
      vine.big_break_time?.should be_true
    end

    it "should be false with 5 pomodori" do
      vine.add(TomatoPaste::Pomodoro.new("Make chunky ragu!"))
      vine.big_break_time?.should be_false
    end

    it "should be true with 8 pomodori" do
      4.times do |n|
        vine.add(TomatoPaste::Pomodoro.new("More tomato work to do #{n}"))
      end
      vine.big_break_time?.should be_true
    end
  end
end