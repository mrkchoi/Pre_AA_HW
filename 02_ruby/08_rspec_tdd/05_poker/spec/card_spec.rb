require 'card'


describe Card do
  subject(:card) {Card.new(value, "#{suit}")}

  describe '#value' do
    let(:value) {2}
    let(:suit) {:spades}

    it 'has a value between 2 and 14' do 
      expect(card.value).to eq(2)
    end

    it 'has a suit value of :spades, :clubs, :diamonds, or :hearts' do
      expect(card.suit).to eq("spades")
    end
  end
end