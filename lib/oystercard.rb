class OysterCard
  attr_reader :balance, :entry_station, :journey_history, :exit_station

  MAX_LIMIT = 90
  MIN_LIMIT = 1

  def initialize
    @balance = 0
    @journey_history = {}
  end

  def top_up(amount)
    fail "Max limit reached #{MAX_LIMIT}" if (@balance + amount) > MAX_LIMIT
    @balance += amount
  end


  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    @entry_station = station
    @journey_history[:entry_station] = station
    fail "No Entry" if @balance < MIN_LIMIT
  end

  def touch_out(station)
    @exit_station = station
    @journey_history[:exit_station] = station
    deduct(MIN_LIMIT)
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end


end
