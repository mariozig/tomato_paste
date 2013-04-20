module TomatoPaste
  class Pomodoro
    attr_reader :description, :work_timer, :break_timer, :state

    def initialize(description)
      @description = description
      @work_timer = Timer.new(1500) # 25 minutes
      @break_timer = Timer.new(300) # 5 minutes
      @state = :unstarted
    end
  end
end