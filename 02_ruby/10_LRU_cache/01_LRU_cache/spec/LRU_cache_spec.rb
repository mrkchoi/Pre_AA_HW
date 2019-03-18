require 'LRU_cache'

describe LRUCache do
  subject(:cache) {LRUCache.new(2)}

  describe '#initialize' do
    it 'sets a new LRUCache as an empty array' do
      expect(cache.cache).to eq([])
    end

    it 'sets the cache size to a given argument' do
      expect(cache.size).to eq(2)
    end
  end

  describe '#count' do
    it 'returns the number of current elements in the cache' do
      cache.add(1)
      cache.add(2)
      cache.add(3)
      expect(cache.count).to eq(2)
    end
  end

  describe '#add' do
    it 'adds a given element to the cache' do
      cache.add(1)
      expect(cache.show).to eq([1]) 
    end

    it 'keeps the cache a max of size' do
      cache.add(1)
      cache.add(2)
      cache.add('hello')
      cache.add('world')
      cache.add({:this => 'hash'})
      expect(cache.count).to eq(2)
    end
  end

  describe '#show' do
    it 'displays all items in the cache' do
      cache.add(2)
      cache.add('hello')
      expect(cache.show).to eq([2, 'hello'])
    end
  end
end