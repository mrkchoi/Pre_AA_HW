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








class LinkedList
  class Node
    attr_accessor :value
    def initialize(value)
      @value = value
      @next_node = nil
    end
  end

  def append(value)

  end

  def prepend(value)
  end

  def size
  end

  def head
  end

  def tail
  end

  def at(index)
  end

  def pop
  end

  def contains?(value)
  end

  def find(data)
  end

  def to_s
  end
end