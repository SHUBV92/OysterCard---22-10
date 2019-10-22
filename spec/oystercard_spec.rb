require 'oystercard'

describe OysterCard do
  it 'has a balance of zero' do 
    expect(subject.balance).to eq(0) 
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
end 




