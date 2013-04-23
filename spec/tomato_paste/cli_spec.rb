require 'spec_helper'

describe TomatoPaste::Cli do

  describe "#ascii_banner" do
    subject(:cli) { described_class.new }

    its(:ascii_banner) { should be_a(String) }
  end

  describe "task_loop" do
    it "successfully performs a single pomodoro" do
      input_one_task = StringIO.new("pomodoro_description\nN\n")
      output = StringIO.new

      described_class.new(input_one_task, output).task_loop

      output.string.should include("Starting Pomodoro #1", "Pomodoro #1 complete!")
      output.string.should_not include("#2")
    end

    it "successfully performs multiple pomodori" do
      input_two_tasks = StringIO.new("pomodoro1\ny\npomodoro2\nN\n")
      output = StringIO.new

      described_class.new(input_two_tasks, output).task_loop

      output.string.should include("Starting Pomodoro #1", "Pomodoro #1 complete!")
      output.string.should include("Starting Pomodoro #2", "Pomodoro #2 complete!")
    end
  end

end