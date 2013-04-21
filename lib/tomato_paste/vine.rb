module TomatoPaste
  class Vine
    attr_reader :pomodori

    def initialize()
      @pomodori = []
    end

    def add(pomodoro)
      @pomodori << pomodoro
    end

    def big_break_time?
      # a big break should happen every 4 pomodori
      !@pomodori.empty? && @pomodori.count % 4 == 0
    end
  end
end