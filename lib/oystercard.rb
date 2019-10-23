class OysterCard
  attr_reader :balance

  MAX_LIMIT = 90

  def initialize
      @balance = 0
      @in_use = false 
  end

  def top_up(amount)
    fail "Max limit reached #{MAX_LIMIT}" if (@balance + amount) > MAX_LIMIT
    @balance += amount
  end

 

  def deduct(amount)
    @balance -= amount
  end

def in_journey?
    @in_use
end 

def touch_in 
  fail "No Entry" if @balance < 1
   @in_use = true 
end 

def touch_out 
  
  @in_use = false 

end 



end
