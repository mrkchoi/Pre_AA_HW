require 'stack'

describe Stack do 
  let(:stack) {Stack.new([5,4,3,2,1])}

  describe '#initialize' do
    it 'starts a new stack as an array' do
      expect(stack.tower).to be_instance_of(Array)
    end
  end

  describe '#peek' do
    it 'shows the last element in the array/stack' do 
      expect(stack.peek).to eq(1)
    end
  end

  describe '#push' do
    it 'adds a new element to the end of the stack' do
      expect(stack.push(0)).to eq([5,4,3,2,1,0])
    end
  end

  describe '#pop' do
    it 'removes the last element from the stack' do
      expect(stack.pop).to eq(1)   
    end
  end
end