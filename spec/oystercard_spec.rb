require 'oystercard'

describe OysterCard do
 
 context '#initialize' do
  it "instance is created does journey equals false" do
   expect(subject.in_journey?).to eq false  
  end
 
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

end 
 
describe '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it "to raise an error when balance reaches £90" do
      card = OysterCard.new
      card.top_up(60)
      expect { card.top_up(40) }.to raise_error("Max limit reached #{OysterCard::MAX_LIMIT}")
    end
  end

  describe "#deduct" do

    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'it deducts the argument from balance' do
      card = OysterCard.new
      card.top_up(50)
      expect { card.deduct(30) }.to change { card.balance }.by -30
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
      card.touch_in
      expect(card.in_journey?).to eq true 
    end 
  end 

  describe '#touch_out' do 
    it " register the card is out of journey" do
      card = OysterCard.new
      card.touch_out
      expect(card.in_journey?).to eq false
    end 
  end 


end
