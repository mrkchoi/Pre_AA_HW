
class LRUCache
    def initialize(size)
      @size = size
      @cache = []
    end

    def count
      # returns number of elements currently in cache
      @cache.size
    end

    def add(el)
      # adds element to cache according to LRU principle
      if count < @size
        @cache.push(el)
      elsif count == @size
        @cache.shift
        @cache.push(el)
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      @cache
    end

    private
    # helper methods go here!

end

c = LRUCache.new(3)
c.add(1)
c.add(2)
c.add(3)