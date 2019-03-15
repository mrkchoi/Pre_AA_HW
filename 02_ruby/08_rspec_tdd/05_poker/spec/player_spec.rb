require 'player'

describe Player do
  subject(:player) {Player.new('player1', 1)}


  describe '#discard' do
    # let(:hand) {double('hand', cards => [[2, 'spades'], [3, 'spades'], [4, 'spades'], [5, 'spades'], [6, 'spades']])}
    
    it "should discard 1 - 5 cards in the player's current hand" do
      player.hand.add_card_to_hand([2, 'spades'])
      player.hand.add_card_to_hand([3, 'spades'])
      player.hand.add_card_to_hand([4, 'spades'])
      player.hand.add_card_to_hand([5, 'spades'])
      player.hand.add_card_to_hand([6, 'spades'])

      player.discard([0, 2, 4])
      expect(player.hand.cards.count).to eq(2)
    end

  end

  describe '#bet' do

    it "removes the bet amount from the player's pot" do
      player.bet(100)
      expect(player.pot).to eq(900)
    end

    it "returns the bet amount" do 
      expect(player.bet(500)).to eq(500)
      expect(player.bet(100)).to eq(100)
    end

    it 'does not allow for bets greater than pot amount' do
      expect(player.bet(5000)).to eq('Not enough funds!')
    end
  end

  describe "#fold" do
    it "sets the player's status as inactive for the round" do
      player.fold
      expect(player.active).to eq(false)
    end
  end

  describe '#change_player_to_active' do
    it 'sets player to active for round' do
    player.fold
    player.change_player_to_active
    expect(player.active).to eq(true)
    end
  end

  describe "#call" do
    it "removes the call amount from the player's pot" do
      player.call(200)
      expect(player.pot).to eq(800)
    end

    it "returns the call amount" do
      expect(player.call(150)).to eq(150)
      
    end

    it 'returns the total call amount if call is greater than pot' do
      expect(player.call(1500)).to eq(1000)
    end
  end

  describe "#raise" do
    it "removes the raise amount from the player's pot" do
      player.raise(50)
      expect(player.pot).to eq(950)
    end

    it "returns the raise amount" do
      expect(player.raise(50)).to eq(50)
    end
  end

  describe '#pay_player' do
    it "adds the pot amount to the player's pot" do
      player.pay_player(250)
      expect(player.pot).to eq(1250)
    end
  end
end