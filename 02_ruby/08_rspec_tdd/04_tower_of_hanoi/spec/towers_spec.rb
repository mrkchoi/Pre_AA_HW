require 'towers'

describe Towers do
  let(:tower) {Tower.new}

  describe '#initialize' do
    let(:stack) {double('stack')}

    it 'creates a new board instance as an array of length 3' do
      expect(board.towers).to be_instance_of(Array)
    end
  end

  describe '#valid_move?' do
    it 'returns boolean indicating whether move is valid' do
      expect(board.valid_move?([1, 2])).to eq true
      expect(board.valid_move?([2, 3])).to eq false
    end
  end

end