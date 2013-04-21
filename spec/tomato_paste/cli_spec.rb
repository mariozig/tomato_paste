require 'spec_helper'

describe TomatoPaste::Cli do

  describe "#run" do
    it "shows logo/banner by calling #ascii_banner" do
      described_class.should_receive(:ascii_banner)
      described_class.run
    end

  end

end