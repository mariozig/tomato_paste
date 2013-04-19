require 'rubygems'
require 'bundler/setup'
require 'timecop'

require 'tomato_paste'
require 'tomato_paste/pomodoro'
require 'tomato_paste/timer'

RSpec.configure do |config|
  config.color = true
  Timecop.return
end