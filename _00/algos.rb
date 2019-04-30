# # CTCI 1.1
# # Is Unique: Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?

# # Solution #1
# # def is_unique(str)
# #   counts = Hash.new(0)
# #   str.each_char {|char| counts[char] += 1}
# #   counts.values.all? {|val| val == 1}
# # end

# # Time: O(n)
# # Space: O(n)


# # Solution #2
# # def is_unique(str)
# #   str.chars.uniq == str.chars
# # end

# # Time: O(n)
# # Space: O(n)


# # Solution #3
# # def is_unique(str)
# #   i = 0
# #   while i < str.length
# #     j = 0
# #     while j < str.length
# #       if str[i] == str[j] && (i != j)
# #         return false
# #       end
# #       j += 1
# #     end
# #     i += 1
# #   end
# #   true
# # end

# # Time: O(n^2)
# # Space: O(n)


# # Solution #4
# def is_unique(str)
#   count = Hash.new

#   str.each_char do |char|
#     if count[char]
#       return false
#     end
#     count[char] = true
#   end
#   true
# end

# # Time: O(n)
# # Space: O(n)


# # p is_unique('hello') # => false
# # p is_unique('abcdef') # => true
# # p is_unique('aaaaaaaaaaa') # => false
# # p is_unique('abcdefghijklmnopqrstuvwxyz') # => true
# # p is_unique('this may be un1q') # => false





# # CTCI 1.8
# # Zero Matrix: Write an algorithm such that if an element in an M x N matrix is 0, its entire row and column are set to 0.

# # Solution #1
# def zero_matrix(arr)
#   row = arr.length
#   col = arr[0].length
#   dup_arr = arr.dup
#   matched_row = []
#   matched_col = []

#   arr.each do |row|
#     p row
#   end
#   p '----------'
#   i = 0
#   while i < row
#     j = 0
#     while j < col
#       if arr[i][j] == 0
#         matched_row << i
#         matched_col << j
#       end      
#       j += 1
#     end
#     i += 1
#   end

#   i = 0
#   while i < row
#     j = 0
#     while j < col
#       if matched_row.include?(i) || matched_col.include?(j)
#         dup_arr[i][j] = 0
#       end
#       j += 1
#     end
#     i += 1
#   end
#   dup_arr.each do |row|
#     p row
#   end
# end

# # Time: O(n)
# # Space: O(n)


# # m1 = [
# #   [1,2,3,4,5],
# #   [1,2,0,4,5],
# #   [1,2,3,4,5],
# #   [1,2,3,4,0]
# # ]
# # zero_matrix(m1)





# # CTCI 1.9 
# # String Rotation: Assume you have a method isSubstring which checks if one word is a substring of another. Given two strings s1 and s2, write code to check if s2 is a rotation of s1 using only one call to isSubstring (e.g. 'waterbottle' is a rotation of 'erbottlewat').

# def is_rotation(s1, s2)
#   return false if s1.length != s2.length
#   a1 = s1.chars
#   a2 = s2.chars

#   s2.length.times do 
#     if a2.unshift(a2.pop()) == a1
#       return true
#     end
#   end

#   false
# end

# # Time: O(n)
# # Space: O(n)


# # p is_rotation('waterbottle', 'erbottlewat') # => true
# # p is_rotation('hello', 'lohel') # => true
# # p is_rotation('true', 'false') # => false




# # CTCI 2.1
# # Remove Dups: Write code to remove duplicates from an unsorted linked list.
# # Followup: How would you solve this problem if a temporary buffer is not allowed?


# def remove_dups(head)
# end


# # class SinglyNode
# #   attr_accessor :value, :next

# #   def initialize(value)
# #     @value = value
# #     @next = nil
# #   end
# # end


# # h1 = SinglyNode.new(1)
# # h2 = SinglyNode.new(2)
# # h3 = SinglyNode.new(3)
# # h4 = SinglyNode.new(4)

# # h1.next = h2
# # h2.next = h3
# # h3.next = h4
# # h4.next = nil


# # class DoublyNode
# #   attr_accessor :value, :prev, :next
# #   def initialize(value)
# #     @value = value
# #     @prev = nil
# #     @next = nil
# #   end
# # end

# # d1 = DoublyNode.new(1)
# # d2 = DoublyNode.new(2)
# # d3 = DoublyNode.new(3)
# # d4 = DoublyNode.new(4)
# # d5 = DoublyNode.new(5)

# # d2.prev = d1
# # d3.prev = d2
# # d4.prev = d3
# # d5.prev = d4

# # d1.next = d2
# # d2.next = d3
# # d3.next = d4
# # d4.next = d5




# # Singly Linked List

# class Node
#   attr_accessor :value, :next
#   def initialize(value)
#     @value = value
#     @next = nil
#   end
# end



# class LinkedList
#   def initialize(head)
#     @head = head
#     @tail = nil
#   end

#   def append(value)
#     new_node = Node.new(value)

#     node = @head

#     until node.next.nil?
#       node = node.next
#     end

#     node.next = new_node
#   end

#   def prepend(value)
#     new_node = Node.new(value)
#     new_node.next = @head
#     @head = new_node
#   end

#   def size
#     count = 1

#     node = @head

#     until node.next.nil?
#       count += 1
#       node = node.next
#     end

#     count
#   end

#   def head
#     @head
#   end

#   def tail
#     node = @head

#     until node.next.nil?
#       node = node.next
#     end

#     node
#   end

#   def at(index)
#     cur_idx = 0
#     node = @head

#     until node.next.nil?
#       return node if cur_idx == index
#       cur_idx += 1
#     end

#     false
#   end

#   def pop
#     prev_node = nil
#     cur_node = @head

#     until cur_node.next.nil?
#       prev_node = cur_node
#       cur_node = cur_node.next
#     end
#     prev_node.next = nil
#     prev_node
#   end

#   def contains?(value)
#     node = @head

#     until node.next.nil?
#       if node.value == value
#         return true
#       end
#       node = node.next
#     end

#     false
#   end

#   def find(data)
#     idx = 0
#     node = @head

#     until node.next.nil?
#       return idx if node.value == data
#       node = node.next
#       idx += 1
#     end

#     false
#   end

#   def to_s
#     node = @head
#     output_str = "( #{node.value} ) -> "

#     until node.next.nil?
#       node = node.next
#       output_str += "( #{node.value} ) -> "
#     end
#     output_str += 'nil'
#     p output_str
#   end
# end



# # l = LinkedList.new(Node.new(1))
# # l.append(2)
# # l.append(3)
# # l.append(4)
# # l.append(5)








# # Doubly Linked List



# class DoublyLinkedListNode
#   attr_accessor :value, :prev, :next
#   def initialize(value)
#     @value = value
#     @prev = nil
#     @next = nil
#   end
# end

# class DoublyLinkedList
#   attr_accessor :head
#   def initialize(head)
#     @head = head
#   end

#   def append(value)
#     new_node = DoublyLinkedListNode.new(value)
#     node = @head

#     if node.next.nil?
#       node.next = new_node
#       new_node.prev = node  
#       return new_node
#     end

#     until node.next.nil?
#       node = node.next
#     end

#     node.next = new_node
#     new_node.prev = node
#     new_node  
#   end

#   def prepend(value)
#     new_node = DoublyLinkedListNode.new(value)
    
#     new_node.next = @head
#     @head.prev = new_node
#     @head = new_node
#   end

#   def size
#     return 0 if @head.nil?
#     size = 1
#     node = @head

#     until node.next.nil?
#       node = node.next
#       size += 1
#     end
#     size
#   end

#   def head
#     @head
#   end

#   def tail
#     return @head if @head.next.nil?
#     node = @head

#     until node.next.nil?
#       node = node.next
#     end
#     node
#   end

#   def at(index)
#     return @head if index == 0
#     cur_idx = 0

#     node = @head
#     until cur_idx == index
#       node = node.next
#       cur_idx += 1
#     end
#     node
#   end

#   def pop
#     prev_node = nil
#     cur_node = @head

#     until cur_node.next.nil?
#       prev_node = cur_node
#       cur_node = cur_node.next
#     end

#     prev_node.next = nil
#     prev_node
#   end

#   def contains?(value)
#     node = @head

#     until node.next.nil?
#       if node.value == value
#         return true
#       end
#       node = node.next
#     end

#     false
#   end

#   def find(data)
#     idx = 0
#     node = @head

#     until node.next.nil?
#       if node.value == data
#         return idx
#       end
#       node = node.next
#       idx += 1
#     end

#     false
#   end

#   def to_s
#     node = @head
#     output_str = "( #{node.value} )"

#     until node.next.nil?
#       node = node.next
#       output_str += " <-> ( #{node.value} )"
#     end
#     output_str += ' -> nil'
#     p output_str
#   end
# end


# # l = DoublyLinkedList.new(DoublyLinkedListNode.new(0))
# # l.append(1)
# # l.append(2)
# # l.append(3)
# # l.append(4)
# # l.append(5)





# # // CTCI 2.1: Remove Dups
# # // Write code to remove duplicates from an unsorted linked list.
# # // Follow up: How would you solve this problem if a temporary buffer is not allowed?

# class Node
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end

# def remove_dups(head)
#   return nil if head.nil?
#   return head if head.next.nil?

#   hash = Hash.new

#   prev_node = nil
#   cur_node = head

#   until (cur_node.nil?)
#     if (!hash[cur_node])
#       hash[cur_node] = true
#       prev_node = cur_node
#       cur_node = cur_node.next
#     else
#       prev_node.next = cur_node.next
#       cur_node = cur_node.next
#     end
#   end
#   head
# end

# list = Node.new(1)
# list.next = Node.new(2)
# list.next.next = Node.new(3)
# list.next.next.next = Node.new(3)
# list.next.next.next.next = Node.new(4)
# list.next.next.next.next.next = Node.new(4)


# list2 = Node.new(1)

# remove_dups(list2)









# # // LC 82: Remove Duplicates from Sorted List II

# def delete_duplicates(head)
#     return nil if head.nil?
#     return head if head.next.nil?
    
#     hash = Hash.new(0)
#     cur = head
    
#     until cur.nil?
#         hash[cur.val] += 1
#         cur = cur.next
#     end

#     dup_vals = hash.select {|k,v| v > 1}

#     cur = head
#     prev = nil
    
#     until cur.nil?
#         if dup_vals[cur.val] && (cur == head)
#             cur = cur.next
#             head = cur
#         elsif dup_vals[cur.val]
#             prev.next = prev.next.next
#             cur = prev.next
#         else
#             prev = cur
#             cur = cur.next
#         end
#     end
#     head
# end




# # LC 19: Remove Nth Node From End of List
# def remove_nth_from_end(head, n)
#   return nil if head.next.nil? && n == 1 || head.nil?

#   length = 1
#   node = head

#   while node.next != nil
#     node = node.next
#     length += 1
#   end

#   remove_pos = length - (n-1)
#   cur_pos = 1
#   node = head
#   prev = nil

#   until cur_pos == remove_pos
#     prev = node
#     node = node.next
#     cur_pos += 1
#   end

#   if prev === nil
#     return head.next
#   else 
#     prev.next = node.next
#   end

#   head
# end



# # LC 148: Sort Linked List
# # def sort_list(head)
# #   return head if head.nil? || head.next.nil?

# #   prev = nil
# #   slow = head
# #   fast = head

# #   while !fast.nil? && !fast.next.nil?
# #     prev = slow
# #     slow = slow.next
# #     fast = fast.next.next
# #   end

# #   prev.next = nil

# #   l1 = sort_list(head)
# #   l2 = sort_list(slow)

# #   return merge(l1, l2)
# # end

# # def merge(l1, l2)
# #   l = ListNode.new(0)
# #   p = l

# #   while !l1.nil? && !l2.nil?
# #     if l1.val < l2.val
# #       p.next = l1
# #       l1 = l1.next
# #     else
# #       p.next = l2
# #       l2 = l2.next
# #     end
# #     p = p.next
# #   end

# #   if !l1.nil?
# #     p.next = l1
# #   end

# #   if !l2.nil?
# #     p.next = l2
# #   end

# #   return l.next
# # end


















































# # LC 237: Delete Node from Linked List

# def sort_list(head)
#   return head if head.nil? || head.next.nil?

#   prev = nil
#   slow = head
#   fast = head

#   while !fast.nil? && !fast.next.nil?
#     prev = slow
#     slow = slow.next
#     fast = fast.next.next
#   end

#   prev.next = nil
#   l1 = sort_list(head)
#   l2 = sort_list(slow)

#   return merge(l1, l2)
# end


# def merge(l1, l2)
#   l = ListNode.new(0)
#   p = l

#   while !l1.nil? && !l2.nil?
#     if l1.val < l2.val
#       p.next = l1
#       l1 = l1.next
#     else
#       p.next = l2
#       l2 = l2.next
#     end
#     p = p.next
#   end

#   if l1.nil?
#     p.next = l2
#   elsif l2.nil?
#     p.next = l1
#   end

#   return l.next
# end





# def delete_node(node)
#     n = node.next
#     node.val = n.val
#     node.next = n.next
# end






















# # LC 1019: Next Greater Node in Linked List
# def next_larger_nodes(head)
#   return [0] if head.nil? || head.next.nil?
#   output = []

#   p1 = head
#   p2 = head.next
#   found = true

#   while !p1.nil?
#     found = false
#     while !p2.nil? && !found
#       if p2.val > p1.val
#         output << p2.val
#         found = true
#         break
#       end
      
#       p2 = p2.next
#     end
#     output << 0 if found == false
#     p1 = p1.next
#     p2 = p1.next if !p1.nil?
    
#   end

#   output
# end


# def next_larger_nodes(head)
#   res, stack = [], []

#     while head
#       while !stack.empty? && stack[-1][1] < head.val
#         res[stack.pop()[0]] = head.val
#       end

#       stack.push([res.length, head.val])
#       res.push(0)
#       head = head.next
#     end

#     res
# end








# # LC 232: Implement Queue using Stacks
# class MyQueue

# =begin
#     Initialize your data structure here.
# =end
#     def initialize()
#         @length = 0
#         @inStack = []
#         @outStack = []
#     end


# =begin
#     Push element x to the back of queue.
#     :type x: Integer
#     :rtype: Void
# =end
#     def push(x)
#         @inStack.push(x)
#     end


# =begin
#     Removes the element from in front of queue and returns that element.
#     :rtype: Integer
# =end
#     def pop()
#         return nil if @inStack.empty?

#         until @inStack.empty?
#           @outStack.push(@inStack.pop())
#         end

#         removed = @outStack.pop()

#         until @outStack.empty?
#           @inStack.push(@outStack.pop())
#         end

#         removed
#     end


# =begin
#     Get the front element.
#     :rtype: Integer
# =end
#     def peek()
#         return nil if @inStack.empty?

#         until @inStack.empty?
#           @outStack.push(@inStack.pop())
#         end
        
#         peek_el = @outStack[-1]

#         until @outStack.empty?
#           @inStack.push(@outStack.pop())
#         end

#         peek_el
#     end


# =begin
#     Returns whether the queue is empty.
#     :rtype: Boolean
# =end
#     def empty()
#         @inStack.empty?
#     end


# end

# # Your MyQueue object will be instantiated and called as such:
# # obj = MyQueue.new()
# # obj.push(x)
# # param_2 = obj.pop()
# # param_3 = obj.peek()
# # param_4 = obj.empty()










# # LC 1021: Remove Outermost Parentheses
# # @param {String} s
# # @return {String}
# def remove_outer_parentheses(s)
#     output = ''
#     c = 0
    
#     s.each_char do |char|
#         if char == '('
#             c += 1
#             output += char if c > 1
#         elsif char == ')'
#             if c > 1
#                 output += char
#                 c -= 1
#             else
#                 c = 0
#             end
#         end
#     end
#     output
# end




# # LC 844: Backspace String Compare
# def backspace_compare(s, t)    
#     s_stack = []
#     t_stack = []
    
#     s.each_char do |char|
#         if char != '#'
#             s_stack.push(char)
#         elsif s_stack.empty?
#             next
#         else
#             s_stack.pop()
#         end
#     end
    
#     t.each_char do |char|
#         if char != '#'
#             t_stack.push(char)
#         elsif t_stack.empty?
#             next
#         else
#             t_stack.pop()
#         end
#     end    
    
#     s_stack == t_stack
# end









# Array Pair Sum:	Given an integer array, output all pairs that sum up to a specific value k
# def pair_sum(arr, target)
#   pairs = []
#   hash = Hash.new

#   arr.each do |el|
#     if hash[el]
#       pairs << [hash[el], el]
#     else
#       hash[target - el] = el
#     end
#   end
#   pairs
# end


# arr = [1,4,3,6,5,7,2,4]
# p pair_sum(arr, 5)







# # Matrix Region Sum:	Given a matrix of integers and coordinates of a rectangular region within the matrix, find the sum of numbers falling inside the rectangle. Our program will be called multiple times with different rectangular regions from the same matrix.
# def matrix_region_sum(matrix, coords)
#   sum = 0
#   c1, c2 = coords

#   if c1[0] < 0 || c1[0] >= matrix.length || c2[0] < 0 || c2[0] >= matrix.length || c1[1] < 0 || c1[1] >= matrix[0].length || c2[1] < 0 || c2[1] >= matrix[0].length
#     return nil
#   end

#   matrix.each_with_index do |row, row_i|
#     row.each_with_index do |col, col_i|
#       if row_i >= c1[0] && row_i <= c2[0] && col_i >= c1[1] && col_i <= c2[1]
#         sum += matrix[row_i][col_i]
#       end
#     end
#   end

#   sum
# end


# matrix = [
#   [4,5,6,2,4,8],
#   [7,0,2,3,4,8],
#   [0,1,6,2,8,4]
# ]
# p matrix_region_sum(matrix, [[1,2],[2,4]]) # => 25











# # largest Continuous Sum: Given an array of integers (positive and negative) find the largest continuous sum.
# def largest_continuous_sum(arr)
#   sums = [arr[0]]

#   arr.each_with_index do |el, i|
#     next if i == 0

#     if sums[-1] + el < 0
#       sums << 0
#     else
#       sums << sums[-1] + el
#     end
#   end
#   sums.max
# end


# arr = [1,-5,4,-2,-7,0,3,3,-4]
# p largest_continuous_sum(arr) # => 6




# Find Missing Element:	There is an array of non-negative integers. A second array is formed by shuffling the elements of the first array and deleting a random element. Given these two arrays, find which element is missing in the second array.
# Solution #1
# def find_missing_element(arr1, arr2)
#   (arr1 - arr2).first
# end

# # Solution #2:
# def find_missing_element(arr1, arr2)
#   hash1 = Hash.new
#   hash2 = Hash.new

#   arr1.each {|el| hash1[el] = true}
#   arr2.each {|el| hash2[el] = true}

#   (hash1.keys - hash2.keys).first
# end

# arr1 = [1,2,3,4,5,6,7,8,9]
# arr2 = [9,7,6,5,4,3,2,1]
# p find_missing_element(arr1, arr2) # => 8









# # Linked List Remove Nodes:	Given a linkedlist of integers and an integer value, delete every node of the linkedlist containing that value.
# def remove_nodes(head, val)
#   return nil if head.nil? || head.val == val

#   prev = nil
#   cur = head
#   while cur != nil
#     if cur == head && cur.val == val
#       head = head.next
#       cur = head
#       next
#     elsif cur.val == val
#       prev.next = cur.next
#     end

#     prev = cur
#     cur = cur.next
#   end
  
#   head
# end

# class Node
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end

# head = Node.new(1)
# n1 = Node.new(2)
# n2 = Node.new(3)
# n3 = Node.new(2)
# n4 = Node.new(5)

# head.next = n1
# n1.next = n2
# n2.next = n3
# n3.next = n4

# p remove_nodes(head, 2) # =>    1 -> 3 -> 5












# Combine Two Strings:	We are given 3 strings: str1, str2, and str3. Str3 is said to be a shuffle of str1 and str2 if it can be formed by interweaving the characters of str1 and str2 in a way that maintains the left to right ordering of the characters from each string. For example, given str1=”abc” and str2=”def”, str3=”dabecf” is a valid shuffle since it preserves the character ordering of the two strings. So, given these 3 strings write a function that detects whether str3 is a valid shuffle of str1 and str2.

# def combine_two_strings(str1, str2, str3)
#   return false if str3.length != (str1.length + str2.length)
  
#   s1 = str1.chars
#   s2 = str2.chars
#   s3 = str3.chars

#   s3.each do |char|
#     if char == s1[0]
#       s1.shift()
#     elsif char == s2[0]
#       s2.shift()
#     else
#       return false
#     end
#   end

#   s1.empty? && s2.empty?
# end


# str1 = 'abc'
# str2 = 'def'
# str3 = 'dabecf'
# p combine_two_strings(str1, str2, str3)

# str1 = 'abc'
# str2 = 'def'
# str3 = 'abcdef'
# p combine_two_strings(str1, str2, str3)

# str1 = 'abc'
# str2 = 'def'
# str3 = 'abcfed'
# p combine_two_strings(str1, str2, str3)






# LC 704: Binary Search
def search(nums, target)
  l = 0
  h = nums.length - 1

  while l <= h
    m = (l + h) / 2
    if nums[m] == target
      return m
    elsif nums[m] > target
      h = m - 1
    else
      l = m + 1
    end
  end

  return -1
end

p search([1,3,5,7,9], 1) # => 0
p search([1,3,5,7,9], 9) # => 4
p search([1,3,5,7,9], 10) # => -1
