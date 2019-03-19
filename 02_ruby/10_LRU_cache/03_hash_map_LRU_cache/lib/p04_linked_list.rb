class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    if !@prev.nil? && !@next.nil?
      @prev.next == @next
      @next.prev == @prev
    end
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new

    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    each do |node|
      return node.val if node.key == key
    end
    nil
  end

  def include?(key)
    each do |node|
      return true if node.key == key
    end
    false
  end

  def append(key, val)
    prev = @tail.prev
    new_node = Node.new(key, val)

    prev.next = new_node
    new_node.prev = prev

    new_node.next = @tail
    @tail.prev = new_node
  end

  def update(key, val)
    each do |node|
      node.val = val if node.key == key
    end
  end

  def remove(key)
    return nil if !include?(key)

    cur_node = nil
    each do |node|
      cur_node = node if node.key == key
    end

    cur_node.prev.next = cur_node.next
    cur_node.next.prev = cur_node.prev
  end

  def each(&prc)
    cur_link = first
    until cur_link == @tail
      prc.call(cur_link)
      cur_link = cur_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
