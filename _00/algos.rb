# CTCI 1.1
# Is Unique: Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?

# Solution #1
# def is_unique(str)
#   counts = Hash.new(0)
#   str.each_char {|char| counts[char] += 1}
#   counts.values.all? {|val| val == 1}
# end

# Time: O(n)
# Space: O(n)


# Solution #2
# def is_unique(str)
#   str.chars.uniq == str.chars
# end

# Time: O(n)
# Space: O(n)


# Solution #3
# def is_unique(str)
#   i = 0
#   while i < str.length
#     j = 0
#     while j < str.length
#       if str[i] == str[j] && (i != j)
#         return false
#       end
#       j += 1
#     end
#     i += 1
#   end
#   true
# end

# Time: O(n^2)
# Space: O(n)


# Solution #4
def is_unique(str)
  count = Hash.new

  str.each_char do |char|
    if count[char]
      return false
    end
    count[char] = true
  end
  true
end

# Time: O(n)
# Space: O(n)


# p is_unique('hello') # => false
# p is_unique('abcdef') # => true
# p is_unique('aaaaaaaaaaa') # => false
# p is_unique('abcdefghijklmnopqrstuvwxyz') # => true
# p is_unique('this may be un1q') # => false





# CTCI 1.8
# Zero Matrix: Write an algorithm such that if an element in an M x N matrix is 0, its entire row and column are set to 0.

# Solution #1
def zero_matrix(arr)
  row = arr.length
  col = arr[0].length
  dup_arr = arr.dup
  matched_row = []
  matched_col = []

  arr.each do |row|
    p row
  end
  p '----------'
  i = 0
  while i < row
    j = 0
    while j < col
      if arr[i][j] == 0
        matched_row << i
        matched_col << j
      end      
      j += 1
    end
    i += 1
  end

  i = 0
  while i < row
    j = 0
    while j < col
      if matched_row.include?(i) || matched_col.include?(j)
        dup_arr[i][j] = 0
      end
      j += 1
    end
    i += 1
  end
  dup_arr.each do |row|
    p row
  end
end

# Time: O(n)
# Space: O(n)


# m1 = [
#   [1,2,3,4,5],
#   [1,2,0,4,5],
#   [1,2,3,4,5],
#   [1,2,3,4,0]
# ]
# zero_matrix(m1)





# CTCI 1.9 
# String Rotation: Assume you have a method isSubstring which checks if one word is a substring of another. Given two strings s1 and s2, write code to check if s2 is a rotation of s1 using only one call to isSubstring (e.g. 'waterbottle' is a rotation of 'erbottlewat').

def is_rotation(s1, s2)
  return false if s1.length != s2.length
  a1 = s1.chars
  a2 = s2.chars

  s2.length.times do 
    if a2.unshift(a2.pop()) == a1
      return true
    end
  end

  false
end

# Time: O(n)
# Space: O(n)


# p is_rotation('waterbottle', 'erbottlewat') # => true
# p is_rotation('hello', 'lohel') # => true
# p is_rotation('true', 'false') # => false




# CTCI 2.1
# Remove Dups: Write code to remove duplicates from an unsorted linked list.
# Followup: How would you solve this problem if a temporary buffer is not allowed?


def remove_dups(head)
end


# class SinglyNode
#   attr_accessor :value, :next

#   def initialize(value)
#     @value = value
#     @next = nil
#   end
# end


# h1 = SinglyNode.new(1)
# h2 = SinglyNode.new(2)
# h3 = SinglyNode.new(3)
# h4 = SinglyNode.new(4)

# h1.next = h2
# h2.next = h3
# h3.next = h4
# h4.next = nil


# class DoublyNode
#   attr_accessor :value, :prev, :next
#   def initialize(value)
#     @value = value
#     @prev = nil
#     @next = nil
#   end
# end

# d1 = DoublyNode.new(1)
# d2 = DoublyNode.new(2)
# d3 = DoublyNode.new(3)
# d4 = DoublyNode.new(4)
# d5 = DoublyNode.new(5)

# d2.prev = d1
# d3.prev = d2
# d4.prev = d3
# d5.prev = d4

# d1.next = d2
# d2.next = d3
# d3.next = d4
# d4.next = d5




# Singly Linked List

class Node
  attr_accessor :value, :next
  def initialize(value)
    @value = value
    @next = nil
  end
end



class LinkedList
  def initialize(head)
    @head = head
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)

    node = @head

    until node.next.nil?
      node = node.next
    end

    node.next = new_node
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next = @head
    @head = new_node
  end

  def size
    count = 1

    node = @head

    until node.next.nil?
      count += 1
      node = node.next
    end

    count
  end

  def head
    @head
  end

  def tail
    node = @head

    until node.next.nil?
      node = node.next
    end

    node
  end

  def at(index)
    cur_idx = 0
    node = @head

    until node.next.nil?
      return node if cur_idx == index
      cur_idx += 1
    end

    false
  end

  def pop
    prev_node = nil
    cur_node = @head

    until cur_node.next.nil?
      prev_node = cur_node
      cur_node = cur_node.next
    end
    prev_node.next = nil
    prev_node
  end

  def contains?(value)
    node = @head

    until node.next.nil?
      if node.value == value
        return true
      end
      node = node.next
    end

    false
  end

  def find(data)
    idx = 0
    node = @head

    until node.next.nil?
      return idx if node.value == data
      node = node.next
      idx += 1
    end

    false
  end

  def to_s
    node = @head
    output_str = "( #{node.value} ) -> "

    until node.next.nil?
      node = node.next
      output_str += "( #{node.value} ) -> "
    end
    output_str += 'nil'
    p output_str
  end
end



# l = LinkedList.new(Node.new(1))
# l.append(2)
# l.append(3)
# l.append(4)
# l.append(5)








# Doubly Linked List



class DoublyLinkedListNode
  attr_accessor :value, :prev, :next
  def initialize(value)
    @value = value
    @prev = nil
    @next = nil
  end
end

class DoublyLinkedList
  attr_accessor :head
  def initialize(head)
    @head = head
  end

  def append(value)
    new_node = DoublyLinkedListNode.new(value)
    node = @head

    if node.next.nil?
      node.next = new_node
      new_node.prev = node  
      return new_node
    end

    until node.next.nil?
      node = node.next
    end

    node.next = new_node
    new_node.prev = node
    new_node  
  end

  def prepend(value)
    new_node = DoublyLinkedListNode.new(value)
    
    new_node.next = @head
    @head.prev = new_node
    @head = new_node
  end

  def size
    return 0 if @head.nil?
    size = 1
    node = @head

    until node.next.nil?
      node = node.next
      size += 1
    end
    size
  end

  def head
    @head
  end

  def tail
    return @head if @head.next.nil?
    node = @head

    until node.next.nil?
      node = node.next
    end
    node
  end

  def at(index)
    return @head if index == 0
    cur_idx = 0

    node = @head
    until cur_idx == index
      node = node.next
      cur_idx += 1
    end
    node
  end

  def pop
    prev_node = nil
    cur_node = @head

    until cur_node.next.nil?
      prev_node = cur_node
      cur_node = cur_node.next
    end

    prev_node.next = nil
    prev_node
  end

  def contains?(value)
    node = @head

    until node.next.nil?
      if node.value == value
        return true
      end
      node = node.next
    end

    false
  end

  def find(data)
    idx = 0
    node = @head

    until node.next.nil?
      if node.value == data
        return idx
      end
      node = node.next
      idx += 1
    end

    false
  end

  def to_s
    node = @head
    output_str = "( #{node.value} )"

    until node.next.nil?
      node = node.next
      output_str += " <-> ( #{node.value} )"
    end
    output_str += ' -> nil'
    p output_str
  end
end


# l = DoublyLinkedList.new(DoublyLinkedListNode.new(0))
# l.append(1)
# l.append(2)
# l.append(3)
# l.append(4)
# l.append(5)





# // CTCI 2.1: Remove Dups
# // Write code to remove duplicates from an unsorted linked list.
# // Follow up: How would you solve this problem if a temporary buffer is not allowed?

class Node
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

def remove_dups(head)
  return nil if head.nil?
  return head if head.next.nil?

  hash = Hash.new

  prev_node = nil
  cur_node = head

  until (cur_node.nil?)
    if (!hash[cur_node])
      hash[cur_node] = true
      prev_node = cur_node
      cur_node = cur_node.next
    else
      prev_node.next = cur_node.next
      cur_node = cur_node.next
    end
  end
  head
end

list = Node.new(1)
list.next = Node.new(2)
list.next.next = Node.new(3)
list.next.next.next = Node.new(3)
list.next.next.next.next = Node.new(4)
list.next.next.next.next.next = Node.new(4)


list2 = Node.new(1)

remove_dups(list2)









# // LC 82: Remove Duplicates from Sorted List II

def delete_duplicates(head)
    return nil if head.nil?
    return head if head.next.nil?
    
    hash = Hash.new(0)
    cur = head
    
    until cur.nil?
        hash[cur.val] += 1
        cur = cur.next
    end

    dup_vals = hash.select {|k,v| v > 1}

    cur = head
    prev = nil
    
    until cur.nil?
        if dup_vals[cur.val] && (cur == head)
            cur = cur.next
            head = cur
        elsif dup_vals[cur.val]
            prev.next = prev.next.next
            cur = prev.next
        else
            prev = cur
            cur = cur.next
        end
    end
    head
end




# LC 19: Remove Nth Node From End of List
def remove_nth_from_end(head, n)
  return nil if head.next.nil? && n == 1 || head.nil?

  length = 1
  node = head

  while node.next != nil
    node = node.next
    length += 1
  end

  remove_pos = length - (n-1)
  cur_pos = 1
  node = head
  prev = nil

  until cur_pos == remove_pos
    prev = node
    node = node.next
    cur_pos += 1
  end

  if prev === nil
    return head.next
  else 
    prev.next = node.next
  end

  head
end
