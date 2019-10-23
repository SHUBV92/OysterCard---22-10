class OysterCard
  attr_reader :balance

  MAX_LIMIT = 90
  MIN_LIMIT = 1

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    fail "Max limit reached #{MAX_LIMIT}" if (@balance + amount) > MAX_LIMIT
    @balance += amount
  end

 
  def in_journey?
    @in_use
  end 

  def touch_in
    fail "No Entry" if @balance < MIN_LIMIT
    @in_use = true
  end

  def touch_out
    deduct(MIN_LIMIT)
    @in_use = false

  end

private
 
def deduct(amount)
    @balance -= amount
  end


end
