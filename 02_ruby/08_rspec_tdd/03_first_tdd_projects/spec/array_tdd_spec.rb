require 'array_tdd'

describe '#my_uniq' do
  let(:array) {[1,2,2,3,1,4,5]}

  it 'works with an array' do 
    expect(array.my_uniq).to eq(array.uniq)
  end

  it 'works with empty arrays' do
    expect([].my_uniq).to eq([].uniq)
  end

  it 'removes repeated elements from an array' do
    expect(array.my_uniq).to eq(array.uniq)
  end

  it 'returns unique elements in the order they first appear' do
    expect(array.my_uniq).to eq(array.uniq) 
  end

  it 'returns an array' do 
    expect(array.my_uniq).to be_instance_of(Array)
  end
end

describe '#two_sum' do 
  let(:array) {[-1, 0, 2, -2, 1]}

  it 'finds all pairs of indices that sum to 0' do
    expect(array.two_sum).to include([0, 4], [2, 3])
  end

  it 'sorts all pairs of indices in dictionary-wise order' do 
    expect(array.two_sum).to eq([[0, 4], [2, 3]])
  end

  it 'returns nil if there are no pairs that sum to zero' do
    expect([3, 7].two_sum).to eq(nil)
  end

  it 'returns nil for an empty array' do
    expect([].two_sum).to eq(nil)
  end
end

describe '#my_transpose' do
  let(:arr) {[[0, 1, 2], [3, 4, 5], [6, 7, 8]]}

    it 'returns an array' do 
      expect(arr.my_transpose).to be_instance_of(Array)
    end

    it 'transposes rows to columns' do 
      expect(arr.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end

    it 'keeps all of the original values' do 
      expect(arr.my_transpose.flatten.sort).to eq(arr.flatten.sort)
    end
end

describe '#stock_picker' do
  let(:arr) {[1,2,0,4,3,8]}
  it 'should output an array with two integers' do
    expect(arr.stock_picker).to be_instance_of(Array)
    expect(arr.stock_picker.length).to eq(2)
    expect(arr.stock_picker[0]).to be_instance_of(Integer)
    expect(arr.stock_picker[1]).to be_instance_of(Integer)
    
  end

  it 'should return the most profitable pair of days' do
    expect(arr.stock_picker).to eq([2,5])
  end

  it 'should return nil if given an empty array' do
    expect([].stock_picker).to eq(nil)
  end
end