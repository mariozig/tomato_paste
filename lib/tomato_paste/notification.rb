require 'terminal-notifier'

module TomatoPaste
  class Notification

    NOTIFICATION_SOUND = File.join(TomatoPaste.sounds, "brass-bell.mp3")

    def self.audio_alert_command
      "afplay #{NOTIFICATION_SOUND}"
    end

    def self.play_audio_alert
      system(self.audio_alert_command)
    end

    def self.display_visual_alert(message)
      return false if message.nil? || message.empty?
      TerminalNotifier.notify(message, title: "Tomato Paste")
    end
  end
end