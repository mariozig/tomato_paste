class Timer
  attr_reader :duration, :end_time, :current_time, :state, :start_time

  def initialize(duration_in_seconds)
    @duration = duration_in_seconds
    @state = :idle
  end

  def start
    @start_time = Time.now
    @end_time = @start_time + @duration
    @state = :running
  end

  def done?
    return false if @start_time.nil?
    Time.now >= @start_time
  end

end