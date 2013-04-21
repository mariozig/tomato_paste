require 'term/ansicolor'
include Term::ANSIColor

class String
  include Term::ANSIColor
end

module TomatoPaste
  class Cli
    def self.run
      puts self.ascii_banner
      vine = Vine.new
    end

    # Prints the colored "logo" of sorts
    # "jgs" is the author of this awesome ascii tomato
    def self.ascii_banner
      banner = "                     |  \n"
      banner += "         __\\W/__     ".green.bold + "|   _____                     _          ____           _       \n"
      banner += "       .'.-'|'-.'.   ".red.bold + "|  |_   _|__  _ __ ___   __ _| |_ ___   |  _ \\ __ _ ___| |_ ___ \n"
      banner += "      /           \\  ".red.bold + "|    | |/ _ \\| '_ ` _ \\ / _` | __/ _ \\  | |_) / _` / __| __/ _ \\\n"
      banner += "      |           |  ".red.bold + "|    | | (_) | | | | | | (_| | || (_) | |  __/ (_| \\__ \\ ||  __/\n"
      banner += "       \\         /   ".red.bold + "|    |_|\\___/|_| |_| |_|\\__,_|\\__\\___/  |_|   \\__,_|___/\\__\\___|\n"
      banner += "   jgs".yellow.bold + "  '-.___.-'    ".red.bold + "|  \n"
      banner += "                     |   \n"

      banner
    end

  end
end