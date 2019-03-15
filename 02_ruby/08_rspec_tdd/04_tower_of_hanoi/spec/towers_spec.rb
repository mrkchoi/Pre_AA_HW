require 'towers'

describe Towers do
  let(:towers) {Towers.new(5)}

  describe '#initialize' do
    it 'creates a new board instance as an array of length 3' do
      expect(towers.towers).to be_instance_of(Array)
    end
  end

  describe '#valid_move?' do
    it 'returns boolean indicating whether move is valid' do
      expect(towers.valid_move?([0, 1])).to eq true
      expect(towers.valid_move?([2, 3])).to eq false
    end
  end

  describe '#make_move' do
    it 'receives a valid move array' do
      expect do
        towers.make_move([0, 1])
      end.to_not raise_error
    end

    it 'calls push & pop for the correct stacks/towers' do
      towers.make_move([0, 1])
      expect(towers.towers[0].tower.length).to eq(4)
      expect(towers.towers[1].tower.length).to eq(1)
    end
  end

end 