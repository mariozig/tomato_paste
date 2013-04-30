module TomatoPaste
  def self.root
    File.expand_path "../..", __FILE__
  end

  def self.sounds
    File.join root, "share", "sounds"
  end
end

require "tomato_paste/version"
require "tomato_paste/cli"
require "tomato_paste/timer"
require "tomato_paste/vine"
require "tomato_paste/pomodoro"
require "tomato_paste/notification"