class OysterCard
  attr_reader :balance, :entry_station

  MAX_LIMIT = 90
  MIN_LIMIT = 1

  def initialize
    @balance = 0
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
    fail "No Entry" if @balance < MIN_LIMIT
  end

  def touch_out
    deduct(MIN_LIMIT)
    @entry_station = nil 
  end

private
 
def deduct(amount)
    @balance -= amount
  end


end
