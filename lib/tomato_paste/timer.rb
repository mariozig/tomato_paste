require "ruby-progressbar"

module TomatoPaste
  class Timer
    attr_reader :duration, :current, :state
    attr_writer :interval_duration # exposed for testing purposes

    def initialize(duration)
      @duration = duration
      @current = 0
      @state = :idle
      @interval_duration = 1
    end

    def start
      @state = :running
      time_becomes_a_loop
    end

    def done?
      @state == :done
    end

    private
      # Orbital http://www.youtube.com/watch?v=7Ab_VDg4M1s
      def time_becomes_a_loop
        progress_bar = ProgressBar.create(:format => 'Elapsed %a [%B] %p%%',
                                          :total => @duration,
                                          :smoothing => 0.6)

        while @current < @duration
          Kernel.sleep @interval_duration
          @current += 1
          progress_bar.increment
        end

        @state = :done
      end

  end
end