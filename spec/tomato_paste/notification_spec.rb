require 'spec_helper'

describe TomatoPaste::Notification do

  describe "audio notification" do
    subject(:notification) { described_class }

    its(:audio_alert_command) { should be_a(String) }
    its(:audio_alert_command) { should == "afplay #{described_class::NOTIFICATION_SOUND}" }
    its(:play_audio_alert) { should be_true }

    it "has a valid file for the NOTIFICATION_SOUND" do
      File.exist?(described_class::NOTIFICATION_SOUND).should be_true
    end
  end

  describe "display_visual_alert" do
    it "returns true when given a message" do
      described_class.display_visual_alert("message").should be_true
    end

    it "returns false when there's no message" do
      described_class.display_visual_alert(nil).should be_false
      described_class.display_visual_alert("").should be_false
    end
  end

end