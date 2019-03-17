require 'byebug'

# my_min
# Given a list of integers find the smallest number in the list.

# Example:

#     list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#     my_min(list)  # =>  -5



def my_min(arr)
  i = 0
  while i < arr.length - 1
    min = arr[i]
    j = i + 1
    while j < arr.length
      if arr[j] < min
        min = arr[j]
        return min
      end
      j += 1
    end
    i += 1
  end
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)


def my_min(arr)
  min = arr[0]
  arr.each {|el| min = el if el < min}
  min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)



# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays and return the max.

# Example:

#     list = [5, 3, -7]
#     largest_contiguous_subsum(list) # => 8

#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7
# Example 2:

#     list = [2, 3, -6, 7, -6, 7]
#     largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
# Example 3:

#     list = [-5, -1, -3]
#     largest_contiguous_subsum(list) # => -1 (from [-1])


def subsums(arr)
  subarrays = []

  # get all subarrays
  i = 0
  while i < arr.length
    j = i
    while j < arr.length
      subarrays << arr[i..j]    
      j += 1
    end
    i += 1
    
  end
  
  # find max of subarray sums
  subarrays.map(&:sum).max
end


# list = [2, 3, -6, 7, -6, 7]
# p subsums(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# p subsums(list) # => -1 (from [-1])





def subsums(arr) # => [1, -1, 1, -1, 2] => 2
  max_so_far = arr.min
  max_to_here = 0

  arr.each do |el|
    max_to_here += el
    if max_so_far < max_to_here
      max_so_far = max_to_here
    end
    if max_to_here < 0
      max_to_here = 0
    end
  end
  max_so_far
end

# list = [2, 3, -6, 7, -6, 7]
# p subsums(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# p subsums(list) # => -1 (from [-1])

# list = [-2, -3, -4, -1, -2, -1, -5, -3]
# p subsums(list)




# Anagrams
# Our goal today is to write a method that determines if two given words are anagrams. This means that the letters in one word can be rearranged to form the other word. For example:

# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true
# Assume that there is no whitespace or punctuation in the given strings.



# Phase I:
# Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. Check if the second string is one of these.

# Hints:

# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of the strings?




def first_anagram?(str, target_str)
  perms = str.chars.permutation.to_a
  perms.map(&:join).include?(target_str)
end

# p first_anagram?("gizmo", "sally") 
# p first_anagram?('elvis', 'lives')
# p first_anagram?('teachaaeeer', 'reeeachaaet')


def second_anagram?(str, target_str)
  matching_idx = []
  str = str.chars
  target_str = target_str.chars

  str.each do |char|
    unless target_str.find_index(char).nil?
      matching_idx << target_str.find_index(char)
      target_str.delete_at(target_str.find_index(char))
    end
  end

  matching_idx.count == str.count && target_str.length == 0
end

# p second_anagram?('elvis', 'lives')
# p second_anagram?("gizmo", "sally")
# p second_anagram?('teachaaeeer', 'reeeachaaet')




def third_anagram?(str, target_str)
  str.chars.sort == target_str.chars.sort
end

# p third_anagram?('elvis', 'lives')
# p third_anagram?("gizmo", "sally")
# p third_anagram?('teachaaeeer', 'reeeachaaet')




def fourth_anagram?(str, target_str)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str.each_char {|char| hash1[char] += 1}
  target_str.each_char {|char| hash2[char] += 1}

  hash1 == hash2
end


def fifth_anagram?(str, target_str)
  hash = Hash.new(0)

  str.each_char {|char| hash[char] += 1}
  target_str.each_char {|char| hash[char] -= 1 if hash[char] != 0}

  hash.values.sum == 0
end

# p fifth_anagram?('elvis', 'lives')
# p fifth_anagram?("gizmo", "sally")
# p fifth_anagram?('teachaaeeer', 'reeeachaaet')






# two_sum?
# Given an array of unique integers and a target sum, determine whether any two integers in the array sum to that amount.

# def two_sum?(arr, target_sum)
#     # your code here...
# end

# arr = [0, 1, 5, 7]
# two_sum?(arr, 6) # => should be true
# two_sum?(arr, 10) # => should be false


def two_sum?(arr, target_sum)
  hash = Hash.new

  arr.each do |el|
    if hash[target_sum - el] == true
      return true
    else
      hash[el] = true
    end
  end
  false
end

# arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false

def bad_two_sum?(arr, target_sum)
  i = 0
  while i < arr.length - 1
    j = i + 1
    while j < arr.length
      return true if arr[i] + arr[j] == target_sum
      j += 1
    end
    i += 1
  end
  false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false


# => target_sum = 10
# => [0, 2, 3, 4, 5, 6, 7]
def okay_two_sum?(arr, target_sum)
  left = 0
  right = arr.length - 1
  diff = Float::INFINITY

  # debugger
  while left < right
    if (arr[left] + arr[right] - target_sum).abs < diff
      diff = (arr[left] + arr[right] - target_sum).abs
    end

    if arr[left] + arr[right] < target_sum
      left += 1
    elsif arr[left] + arr[right] > target_sum
      right -= 1
    end

    return true if diff == 0
  end
  false
end

# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false




# => arr = [1,0,2,5,4,8]
# => window_size = 2

def windowed_max_range(arr, window_size)
  max_windowed_range = nil

  i = 0
  while i <= arr.length - window_size
    cur = arr.slice(i, window_size)
    min = cur.min
    max = cur.max

    if max_windowed_range.nil?
      max_windowed_range = (max - min)
    elsif (max - min) > max_windowed_range
      max_windowed_range = (max - min)
    end
    i += 1
  end
  max_windowed_range
end



# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8






class MyQueue
  def initialize
    @store = []
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.shift
  end
end



class MyStack
  def initialize
    @store = []
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def pop
    @store.pop
  end

  def push(el)
    @store.push(el)
  end
end


class StackQueue
  def initialize
    @store = [MyStack.new, MyStack.new]
  end

  def size
    @store[1].size
  end

  def empty?
    @store[1].empty?
  end

  def enqueue(el)
    stack0 = @store[0]
    stack1 = @store[1]

    stack1.push(el)
  end

  def dequeue
    stack0 = @store[0]
    stack1 = @store[1]

    if stack1.empty?
      return nil
    else
      until stack1.empty?
        stack0.push(stack1.pop)
      end

      stack0.pop

      until stack0.empty?
        stack1.push(stack0.pop)
      end
    end
  end
end


class MyStack
  def initialize
    @store = []
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def pop
    @store.pop
  end

  def push(el)
    @store.push(el)
  end
end


class MinMaxStack
  def initialize
    @store = []
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def pop
    @store.pop
  end

  def push(el)
    
    if @store.empty?
      if el.size == 3
        @store.push(el)
      else
        @store.push([el, el, el])
      end
    else
      if el.size == 3
        @store.push(el)
      else
        @store.push([el, [@store.last[1], el].min, [@store.last[2], el].max])
      end
    end
  end

  def min
    @store.last[1]
  end

  def max
    @store.last[2]
  end
end



class MinMaxStackQueue
  def initialize
    @store = [MinMaxStack.new, MinMaxStack.new]
  end

  def peek
    stack0 = @store[0]
    stack1 = @store[1]
    
    if stack1.empty?
      return nil
    elsif stack1.size == 1
      return stack1.peek
    else
      stack1.size.times do
        stack0.push(stack1.pop)
      end

      peek_el = stack0.peek

      stack0.size.times do
        stack1.push(stack0.pop)
      end
      
      peek_el
    end
  end

  def size
    @store[1].size
  end

  def empty?
    @store[1].empty?
  end

  def enqueue(el)
    @store[1].push(el)
  end

  def dequeue
    # debugger
    stack0 = @store[0]
    stack1 = @store[1]

    if stack1.empty?
      return nil
    elsif stack1.size == 1
      stack1.pop
    else
      stack1.size.times do
        stack0.push(stack1.pop)
      end

      stack0.pop

      stack0.size.times do
        stack1.push(stack0.pop)
      end
    end

  end
end

# mmsq = MinMaxStackQueue.new
# mmsq.enqueue(1)
# mmsq.enqueue(2)
# mmsq.enqueue(3)
# mmsq.enqueue(4)
# mmsq.enqueue(5)
# debugger
# mmsq.dequeue
# p mmsq



























require "byebug"

class MyQueue

  def initialize
    @store = []
  end

  def enqueue(ele)
    @store.unshift(ele)
  end

  def dequeue
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

end


class StackQueue

  def initialize
    @enstack = Stack.new
    @destack = Stack.new
  end

  def enqueue(ele)
    @enstack.push(ele)
  end


  def dequeue
    until enstack.empty?
      @destack.push(@enstack.pop)
    end
    @destack.pop
  end

end

class MinMaxStack

  def initialize
    @store = MyStack.new()
  end

  def pop
    @store.pop
  end

  def min
    empty? ? nil : @store.peek.values[0][0]
  end

  def max
    empty? ? nil : @store.peek.values[0][1]
  end

  def push(ele)
    newhash = Hash.new
    newhash[ele] = find_min(ele),find_max(ele)
    @store.push(newhash)
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def find_max(ele)
    empty? ? ele : [max, ele].max
  end

  def find_min(ele)
    empty? ? ele : [min, ele].min
  end

end


class MinMaxStackQueue
  attr_reader :instack, :outstack

  def initialize
    @instack = MinMaxStack.new
    @outstack = MinMaxStack.new
  end

  def enqueue(ele)
    @instack.push(ele)
  end

  def dequeue
    debugger
    if @outstack.empty?
      until @instack.empty?
        @outstack.push(@instack.pop.keys[0])
      end
        @outstack.pop
    else
      @outstack.pop
    end
  end

  def size
    @instack.size + @outstack.size
  end

  def max
    return @instack.max if @outstack.empty?
    return @outstack.max if @instack.empty?
    [@instack.max, @outstack.max].max
  end

  def min
    return @instack.min if @outstack.empty?
    return @outstack.min if @instack.empty?
    [@instack.min, @outstack.min].min
  end

end

class MyStack
  def initialize(store = [])
    @store = store
  end

  def empty?
    @store.empty?
  end

  def peek
    @store.last
  end

  def pop
    @store.pop
  end

  def push(val)
    @store.push(val)
  end

  def size
    @store.size
  end
end




# mmsq = MinMaxStackQueue.new
# mmsq.enqueue(1)
# mmsq.enqueue(2)
# mmsq.enqueue(3)
# mmsq.enqueue(4)
# mmsq.enqueue(5)
# debugger
# mmsq.dequeue
# p mmsq



class MyStack
  def initialize
    @store = []
  end

  def peek
    @store.last
  end

  def empty?
    @store.empty?
  end

  def size
    @store.size
  end

  def pop
    @store.pop
  end

  def push(el)
    @store.push(el)
  end  
end



class MinMaxStack
  def initialize
    @store = MyStack.new
  end

  def pop
    @store.pop
  end

  def push(el)
    hash = Hash.new
    hash[el] = find_min(el), find_max(el)
    @store.push(hash)
  end

  def min
    empty? ? nil : @store.peek.values[0][0]
  end

  def max
    empty? ? nil : @store.peek.values[0][1]
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def find_max(el)
    empty? ? el : [el, max].max
  end

  def find_min(el)
    empty? ? el : [el, min].min
  end

end


class MinMaxStackQueue
  def initialize
    @instack = MinMaxStack.new
    @outstack = MinMaxStack.new
  end  

  def enqueue(el)
    @instack.push(el)
  end

  def dequeue
    if @outstack.empty?
      until @instack.empty?
        @outstack.push(@instack.pop.keys[0])
      end
      @outstack.pop
    else
      @outstack.pop
    end
  end

  def size
    @instack.size + @outstack.size
  end

  def max
    return @instack.max if @outstack.empty?
    return @outstack.max if @instack.empty?
    [@instack.max, @outstack.max].max
  end

  def min
    return @instack.min if @outstack.empty?
    return @outstack.min if @instack.empty?
    [@instack.min, @outstack.min].min
  end
end


# mmsq = MinMaxStackQueue.new
# mmsq.enqueue(1)
# mmsq.enqueue(2)
# mmsq.enqueue(3)
# mmsq.enqueue(4)
# mmsq.enqueue(5)





def windowed_max_range_stack(arr, window_size)
  max_range = 0
  stack = MinMaxStackQueue.new

  arr.each do |el|
    stack.enqueue(el)
    if stack.size == window_size
      max_range = stack.max - stack.min if max_range < stack.max - stack.min
    elsif stack.size > window_size
      stack.dequeue
      max_range = stack.max - stack.min if max_range < stack.max - stack.min
    end
  end
  max_range
end

# p windowed_max_range_stack([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
# p windowed_max_range_stack([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
# p windowed_max_range_stack([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
# p windowed_max_range_stack([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8






































































# Given an array, and a window size w, find the maximum range (max - min) within a set of w elements.
# e.g. arr = [1,2,3,5], window_size = 3 => 5 - 2 => 3

class MyStack
  def initialize
    @store = []
  end

  def peek
    @store.last
  end

  def empty?
    @store.empty?
  end

  def size
    @store.size
  end

  def push(el)
    @store.push(el)
  end

  def pop
    @store.pop
  end
end



class MinMaxStack
  def initialize
    @store = MyStack.new
  end

  def empty?
    @store.empty?
  end

  # def peek
  #   @store.last
  # end

  def size
    @store.size
  end

  def push(el)
    hash = Hash.new
    hash[el] = find_min(el), find_max(el)
    @store.push(hash)
  end

  def pop
    @store.pop
  end

  def find_min(el)
    empty? ? el : [min, el].min
  end

  def find_max(el)
    empty? ? el : [max, el].max
  end

  def min
    # debugger
    empty? ? nil : @store.peek.values[0][0]
  end

  def max
    empty? ? nil : @store.peek.values[0][1]
  end
end

# mms = MinMaxStack.new
# mms.push(1)
# mms.push(2)
# mms.push(3)
# mms.push(4)
# mms.push(5)


class MinMaxStackQueue
  def initialize
    @instack = MinMaxStack.new
    @outstack = MinMaxStack.new
  end

  def enqueue(el)
    @instack.push(el)
  end

  def dequeue
    if @outstack.empty?
      until @instack.empty?
        @outstack.push(@instack.pop.keys[0])
      end
      @outstack.pop
    else
      @outstack.pop
    end
  end

  def size
    @instack.size + @outstack.size
  end

  def empty?
    @instack.empty? && @outstack.empty?
  end

  def max
    return @instack.max if @outstack.empty?
    return @outstack.max if @instack.empty?
    [@instack.max, @outstack.max].max
  end

  def min
    return @instack.min if @outstack.empty?
    return @outstack.min if @instack.empty?
    [@instack.min, @outstack.min].min
  end
end

# mmsq = MinMaxStackQueue.new
# mmsq.enqueue(1)
# mmsq.enqueue(2)
# mmsq.enqueue(3)
# mmsq.enqueue(4)
# mmsq.enqueue(5)




def windowed_max_range_stack(arr, window_size)
  max_range = 0
  queue = MinMaxStackQueue.new

  arr.each do |el|
    # debugger
    queue.enqueue(el)
    if queue.size == window_size
      max_range = (queue.max - queue.min) if max_range < (queue.max - queue.min)
    elsif queue.size > window_size
      queue.dequeue
      max_range = (queue.max - queue.min) if max_range < (queue.max - queue.min)
    end
  end
  max_range
end


p windowed_max_range_stack([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range_stack([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range_stack([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range_stack([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8








