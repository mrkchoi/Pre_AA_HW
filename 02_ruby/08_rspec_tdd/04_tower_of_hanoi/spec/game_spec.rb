require 'game'

describe Game do
  let(:game) {Game.new}

  describe '#win?' do
    context 'when a game is first started' do
      let(:towers) {double("towers")}
      
      it 'should return true if game is won' do
        @num_towers = 5
        game.towers.towers.last.tower = 5

        expect(game.win?).to eq true
      end
    end
    

    it 'should return false if game is not won'
  end
end