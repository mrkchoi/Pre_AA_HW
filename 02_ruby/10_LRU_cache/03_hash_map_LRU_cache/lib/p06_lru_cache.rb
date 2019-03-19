require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      node = @map[key]
      update_node!(node)
    else
      eject! if count >= @max
      calc!(key)
    end
    @map[key].val
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    # insert into linkedlist
    val = @prc.call(key)
    new_node = @store.append(key, val)
    # add to our hashmap
    @map[key] = new_node
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    key, val = node.key, node.val
    @store.remove(key)
    new_node = @store.append(key, val)
    @map[key] = new_node
  end

  def eject!
    lru_item_key = @store.first.key
    @store.remove(lru_item_key)
    @map.delete(lru_item_key)
  end
end