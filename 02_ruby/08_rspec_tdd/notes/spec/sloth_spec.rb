require 'sloth'
require 'rspec'

describe Sloth do
  subject(:sloth) {Sloth.new('Herbert')}

  describe '#initialize' do
    it 'assigns a name' do
      expect(sloth.name).to eq('Herbert')
    end

    it 'starts with an empty array of foods' do
      expect(sloth.foods).to be_empty
    end
  end

  describe '#eat' do
    it 'adds a new food to the foods array' do
      expect(sloth.foods).to_not include('apple') 
      sloth.eat('apple')
      expect(sloth.eat('apple')).to include('apple') 
    end
  end

  describe '#drink' do
    before(:each) {sloth.drink('lemonade', 10)}

    it 'adds a new drink as a key to the drinks hash' do
      expect(sloth.drinks).to have_key('lemonade')
    end

    it 'adds an amount as a value to the drinks hash' do
      expect(sloth.drinks).to have_value(10)
    end
  end

  describe '#run' do
    it 'returns a string that includes the direction' do
      expect(sloth.run('west')).to include('west')
    end

    it 'raises an ArgumentError if invalid direction given' do
      expect {sloth.run('up')}.to raise_error(ArgumentError)
    end
  end

  describe '#secret_sloth' do
    it 'returns a string with a secret' do
      expect(sloth.secret_sloth).to include('Shhhh..this is a secret!')
    end
  end
end

