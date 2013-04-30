require 'rubygems'
require 'bundler/setup'

require 'tomato_paste'
require 'tomato_paste/pomodoro'
require 'tomato_paste/timer'
require 'tomato_paste/vine'
require 'tomato_paste/cli'
require 'tomato_paste/notification'

RSpec.configure do |config|
  config.color = true
  # config.formatter = :documentation
end