require 'term/ansicolor'

include Term::ANSIColor

class String
  include Term::ANSIColor
end

module TomatoPaste
  class Cli
    def initialize(input = $stdin, output = $stdout)
      @input = input
      @output = output
      @vine = TomatoPaste::Vine.new
    end

    def run
      @output.print ascii_banner
      task_loop
      @output.print "\n\nBye!"
    end

    # Prints the colored "logo" of sorts
    # "jgs" is the author of this awesome ascii tomato
    def ascii_banner
      banner = "               |  \n"
      banner += "   __\\W/__     ".green.bold + "|   _____                     _          ____           _       \n"
      banner += " .'.-'|'-.'.   ".red.bold + "|  |_   _|__  _ __ ___   __ _| |_ ___   |  _ \\ __ _ ___| |_ ___ \n"
      banner += "/           \\  ".red.bold + "|    | |/ _ \\| '_ ` _ \\ / _` | __/ _ \\  | |_) / _` / __| __/ _ \\\n"
      banner += "|           |  ".red.bold + "|    | | (_) | | | | | | (_| | || (_) | |  __/ (_| \\__ \\ ||  __/\n"
      banner += " \\         /   ".red.bold + "|    |_|\\___/|_| |_| |_|\\__,_|\\__\\___/  |_|   \\__,_|___/\\__\\___|\n"
      banner += "  '-.___.-'    ".red.bold + "|  \n"
      banner += "jgs".yellow.bold + "            |   \n"
      banner += "                                                           ...a Pomodoro timer\n"

      banner
    end

    def task_loop(big_break_duration=1200) # 20 minutes
      trap("INT") { quit_on_interrupt }
      begin

        @output.print "\n\n"
        @output.print "Task Description: "
        task_description = @input.gets.chomp

        @vine.add(TomatoPaste::Pomodoro.new(task_description))

        @output.puts
        emit_notification "Starting Pomodoro ##{@vine.pomodori.count}"

        @vine.current_pomodoro.work_timer.start

        TomatoPaste::Notification.play_audio_alert

        if @vine.big_break_time?
          emit_notification "It's time for a big break. Come back in 20 minutes."
          Timer.new(big_break_duration).start
        else
          emit_notification "Pomodoro ##{@vine.pomodori.count} complete. Break starts now!"
          @vine.current_pomodoro.break_timer.start
        end

        TomatoPaste::Notification.play_audio_alert

        emit_notification "Break done!"

        @output.print "\nDo another Pomodoro? (Y/N): "
      end while @input.gets.upcase.chomp != "N"
    end

    private
      def emit_notification(message)
        @output.puts message
        TomatoPaste::Notification.display_visual_alert(message)
      end

      def quit_on_interrupt
        @output.puts
        @output.puts
        @output.puts "I wish I knew how to quit you."
        exit
      end
  end
end