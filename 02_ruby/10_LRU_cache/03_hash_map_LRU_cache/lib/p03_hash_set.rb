class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    self[key.hash] << key
    @count += 1
    
    resize! if @count == num_buckets
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key.hash].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    # double num_buckets
    new_store = Array.new(num_buckets * 2) {Array.new}
    @count = 0
    # reinsert all elements back into new store
    @store.each do |bucket|
      bucket.each do |el|
        new_store.insert(el)
      end
    end
    # set old store to new store
    @store = new_store
  end
end
