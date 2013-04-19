require 'spec_helper'

describe Timer do
  subject(:timer) { Timer.new(5) }

  describe "#new" do
    its(:duration) { should == 5 }
    it "starts"
    it "pauses"
    it "has a current time"
  end
end