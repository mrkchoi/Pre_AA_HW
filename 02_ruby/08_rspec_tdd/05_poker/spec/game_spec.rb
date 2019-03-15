require 'game'

describe Game do 
  subject(:game) {Game.new(Player.new('player1', 1), Player.new('player2', 2))}
  
  describe '#deal_cards' do
    it 'should deal cards to each player until each player has 5 cards' do
      game.deal_cards
      expect(game.game_players[0].hand.cards.count).to eq(5)
      expect(game.game_players[1].hand.cards.count).to eq(5)
    end

    it 'should remove cards from the game deck' do
      game.deal_cards
      expect(game.deck.active_deck.count).to eq(42)
    end
  end

  describe '#switch_player' do
    it 'changes the current player' do
      cur_player = game.current_player
      game.switch_player
      expect(game.current_player).not_to eq(cur_player)
    end
  end

  context 'game cards are dealt to each player' do
    describe '#calculate_best_hand' do
      it 'should determine the winning player of the round' do
        game.deal_cards
        expect(game.calculate_best_hand).to be_instance_of(Player)
      end
    end
  end

  describe '#win_game?' do
      let(:player1) {double("player1", :pot => 1000)}
      let(:player2) {double("player2", :pot => 0)}    
    it 'returns true if only one player has chips remaining' do
      expect(Game.new(player1, player2).win_game?).to eq true
    end

      let(:player3) {double("player3", :pot => 1000)}
      let(:player4) {double("player4", :pot => 100)}    
    it 'returns false if more than one player has chips remaining' do
      expect(Game.new(player3, player4).win_game?).to eq false
    end
  end

  describe '#pay_round_winner' do
    it 'adds the current game pot to the winning player'

    it 'resets the pot to zero'
  end
end