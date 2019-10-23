require 'oystercard'

describe OysterCard do

  let(:station) { double :station }

  context '#initialize' do
    it "instance is created does journey equals false" do
      expect(subject.in_journey?).to eq false
    end

    it 'has a balance of zero' do
      expect(subject.balance).to eq(0)
    end

  end

  
  
  
  describe '#top_up' do

    it 'can top up the balance' do
      expect{ subject.top_up(1) }.to change{ subject.balance }.by(1)
    end

    it "to raise an error when balance reaches £90" do
      card = OysterCard.new
      card.top_up(60)
      expect { card.top_up(40) }.to raise_error("Max limit reached #{OysterCard::MAX_LIMIT}")
    end
  end

  

 
 
  describe "#in_journey" do
    it "checks if in_journey? returns true or false" do
      card = OysterCard.new
      expect([true, false]).to include(card.in_journey?)
    end
  end

  describe '#touch_in' do

   
  it " register the card is in journey" do
      card = OysterCard.new
      card.top_up(10)
      card.touch_in(station)
      expect(card.in_journey?).to eq true
    end
  end 


  it "Raise error if balance below £1" do
    card = OysterCard.new
    expect { card.touch_in(station) }.to raise_error "No Entry"
  end


  it " card to remeber the entry station when touched in" do 
     card = OysterCard.new
     card.top_up(10)
     card.touch_in(station)
     expect(card.entry_station).to eq(station)
  end 

  
  
  describe '#touch_out' do
    it " register the card is out of journey" do
      card = OysterCard.new
      card.touch_out
      expect(card.in_journey?).to eq false
    end

    it "charge the card with right amount" do
      card = OysterCard.new
      card.top_up(10)
      expect{card.touch_out}.to change{card.balance}.by(-OysterCard::MIN_LIMIT)
    end

  end

end

