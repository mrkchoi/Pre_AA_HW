

def title_to_number(s)
  alpha = ('A'..'Z').to_a
  hash = Hash.new
  total = 0
  
  alpha.each_with_index {|el, i| hash[el] = (i+1)}

  str_arr = s.chars
  counter = str_arr.length

  str_arr.each_with_index do |el, i|
    total += hash[el] * (26**(counter - 1))
    counter -= 1
  end

  total
end

# p title_to_number('A')
# p title_to_number('AB')
# p title_to_number('ZY')





# def is_happy(n)
#   100000.times do
#     n = n.to_s.chars.map {|el| el.to_i ** 2}.sum
#     return true if n == 1
#   end

#   return false
# end





def is_happy(n)
  hash = Hash.new(0)

  while n != 1
    n = calculate(n)
    return false if hash.has_key?(n)
    hash[n] += 1
  end

  true
end

def calculate(num)
  total = 0
  while num != 0
    total += (num % 10) ** 2
    num /= 10
  end
  total
end

# p is_happy(100)
# p is_happy(1)
# p is_happy(237)





# Count the number of prime numbers less than a non-negative number, n.
def count_primes(n)
    primes = [0]

    i = 2
    until primes.last >= n
      primes << i if is_prime?(i)
      i += 1
    end

    primes.count - 2
end

def is_prime?(num)
  return false if num <= 1
  return true if num == 2
  (2...num).each {|el| return false if num % el == 0}
  true
end

# p count_primes(100)






def int_to_roman(num)
  roman = {
    'M' => 1000,
    'CM' => 900,
    'D' => 500,
    'CD' => 400,
    'C' => 100,
    'XC' => 90,
    'L' => 50,
    'XL' => 40,
    'X' => 10,
    'IX' => 9,
    'V' => 5,
    'IV' => 4,
    'I' => 1,
  }
  
  output = ''

  until num == 0
    roman.each do |k,v|
      if num >= v
        num -= v
        output += k
        break
      end
    end
  end

  output
end

# p int_to_roman(1994)
# p int_to_roman(4)
# p int_to_roman(9)
# p int_to_roman(58)
# p int_to_roman(20)





def length_of_longest_substring(s)
  max = [0]

  i = 0
  while i < s.length
    cur_hash = Hash.new(0)
    cur_max = 0
    j = i
    while j < s.length
      if !cur_hash.has_key?(s[j])
        cur_hash[s[j]] += 1
        cur_max += 1
      else
        break
      end
      j += 1
    end
    max << cur_max
    i += 1
  end

  max.max
end

require 'byebug'

def length_of_longest_substring(s)
  longest = ''
  current = ''

  s.each_char do |el|
    index = current.index(el)

    if index.nil?
      current += el
      longest = longest.length < current.length ? current : longest
    else
      current = current.slice(index+1..-1) + el
    end
  end

  longest.length
end

# p length_of_longest_substring('aaaaa')
# p length_of_longest_substring('abcabc')
# p length_of_longest_substring('abcabcbb')
# p length_of_longest_substring('pwwkew')




# 11. All Permutations of String
# Generate all permutations of a given string.

def perms(str)
  return [str] if str.length == 1

  char = str.slice!(0)
  permutations = perms(str)
  result = []

  permutations.each do |perm|
    (0..perm.length).each do |j|
      word = perm.dup
      result << word.insert(j, char)
    end
  end

  result
end


# p perms('abc') # => ['abc', 'acb', 'cab', 'bca', 'bac', 'cba']






































































def permute(nums)
    return [nums] if nums.length == 0

    first = nums.slice!(0)
    perms = permute(nums)
    result = []

    perms.each do |perm|
      (0..perm.length).each do |i|
        current = perm.dup
        result << current.insert(i, first)
      end
    end

    result
end

# p permute([1,2,3])



# 12. Reverse Words in a String
# Given an input string, reverse all the words. To clarify, input: “Interviews are awesome!” output: “awesome! are Interviews”. Consider all consecutive non-whitespace characters as individual words. If there are multiple spaces between words reduce them to a single white space. Also remove all leading and trailing whitespaces. So, the output for ”   CS degree”, “CS    degree”, “CS degree   “, or ”   CS   degree   ” are all the same: “degree CS”.

def reverse_string(str)
  return str if str.length == 0 || str.length == 1

  str_arr = str.strip.squeeze(' ').split(' ')
  output = []
  
  (str_arr.length).times do
    output.unshift(str_arr.shift());
  end

  output.join(' ')
end


# p reverse_string('   CS degree')
# p reverse_string('CS    degree')
# p reverse_string('   CS   degree   ')
# p reverse_string('Interviews are awesome!')



# Anagram Strings:	Given two strings, check if they’re anagrams or not. Two strings are anagrams if they are written using the same exact letters, ignoring space, punctuation and capitalization. Each letter should have the same count in both strings. For example, ‘Eleven plus two’ and ‘Twelve plus one’ are meaningful anagrams of each other.

def anagram_strings(str1, str2) 
  clean1 = str1.gsub(/[^a-zA-Z]/, '').squeeze(' ').downcase
  clean2 = str2.gsub(/[^a-zA-Z]/, '').squeeze(' ').downcase

  clean1.chars.sort == clean2.chars.sort
end


# p anagram_strings('Eleven plus two', 'Twelve plus one') # => true
# p anagram_strings('Eleven plus two', 'Twelve plus') # => false








class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

class BST
  attr_accessor :root
  def initialize()
    @root = nil
  end

  def insert(val, root=@root)
    if !root
      @root = TreeNode.new(val)
      return
    end

    if val < root.val
      if root.left
        self.insert(val, root.left)
      else
        root.left = TreeNode.new(val)
      end
    else
      if root.right
        self.insert(val, root.right)
      else
        root.right = TreeNode.new(val)
      end
    end
  end

  def printTreeLevel
    return [] if (!@root)

    output = []
    queue = [@root]

    until queue.empty?
      level = []
      size = queue.length

      size.times do
        node = queue.shift()
        level << node.val

        queue.push(node.left) if node.left
        queue.push(node.right) if node.right
      end

      output << level
    end

    output
  end

  def printPreOrder(root=@root)
    return nil if (!root)

    p root.val
    printPreOrder(root.left)
    printPreOrder(root.right)
  end

  def printInOrder(root=@root)
    return nil if (!root)

    printInOrder(root.left)
    p root.val
    printInOrder(root.right)
  end

  def printPostOrder(root=@root)
    return nil if !root

    printPostOrder(root.left)
    printPostOrder(root.right)
    p root.val
  end

  def bfs(val, root=@root)
    return nil if !root

    queue = [root]

    until queue.empty?
      node = queue.shift()

      return node if node.val == val

      queue.push(node.left) if node.left
      queue.push(node.right) if node.right
    end

    nil
  end

  def dfs(val, root=@root)
    return nil if !root

    stack = [root]

    until stack.empty?
      node = stack.pop()
      p node.val

      return node if node.val == val

      stack.push(node.right) if (node.right)
      stack.push(node.left) if node.left
    end

    nil
  end

  def dfs_recursive(val, root=@root)
    return if (!root)  

    return root if root.val == val
    return dfs_recursive(val, root.left) || dfs_recursive(val, root.right)
  end
end

bst = BST.new()
bst.insert(10)
bst.insert(5)
bst.insert(15)
bst.insert(3)
bst.insert(7)
bst.insert(13)
bst.insert(20)
bst.insert(25)
bst.insert(30)

# p bst.printTreeLevel
# # p bst.dfs(100, bst.root)
# p bst.dfs_recursive(13, bst.root)



def minimalTree(arr)
  return minimalTreeHelper(arr, 0, arr.length - 1)
end

def minimalTreeHelper(arr, start, ending)
  return nil if start > ending

  mid = (start + ending) / 2
  n = TreeNode.new(arr[mid])

  n.left = minimalTreeHelper(arr, start, mid - 1)
  n.right = minimalTreeHelper(arr, mid + 1, ending)

  n
end

# p minimalTree([1,2,3,4,5,6,7,8,9])
# p minimalTree([5,10,15])




def checkBalanced(root)
  return true if !root
  return false if (heightBST(root.left) - heightBST(root.right)).abs > 1
  true
end

def heightBST(root)
  return 0 if !root
  1 + [heightBST(root.left), heightBST(root.right)].max
end

# p heightBST(bst.root)
# p checkBalanced(bst.root)




# CTCI 4.5 Validate BST: Implement a function to check if a binary tree is a binary search tree

class Solution
  attr_accessor :root
  def initialize(root)
    @output = []
    @root = root
  end

  def validate_bst(root=@root)
    return true if (!root) 

    helper(root)

    @output == @output.sort
  end

  def helper(root)
    return nil if (!root)

    helper(root.left) if (root.left) 
    @output << root.val
    helper(root.right) if (root.right)
  end
end

t = TreeNode.new(1)
t2 = TreeNode.new(2)
t3 = TreeNode.new(3)
t4 = TreeNode.new(4)
t5 = TreeNode.new(5)
t6 = TreeNode.new(6)
t7 = TreeNode.new(7)

t.left = t2
t.right = t3
t2.left = t4
t2.right = t5
t3.left = t6
t3.right = t7

s = Solution.new(bst.root)
s2 = Solution.new(t)

# p s.validate_bst
# p s2.validate_bst




# my_each

class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end

    self
  end

  def my_select(&prc)
    output = []
    self.my_each do |el|
      output << el if prc.call(el)
    end

    output
  end

  def my_reject(&prc)
    output = []

    self.my_each do |el|
      output << el if !prc.call(el)
    end

    output
  end

  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el)
    end

    false
  end

  def my_all?(&prc)
    self.my_each do |el|
      return false unless prc.call(el)
    end
    true
  end

  def my_flatten
    res = []

    self.each do |el|
      if !el.is_a?(Array)
        res << el
      else
        res += el.my_flatten
      end
    end
    res
  end

  def my_zip(*args)
    output = Array.new(self.length) {Array.new(args.length+1){nil}}

    self.each_with_index do |el, i|
      output[i][0] = el
    end

    args.each_with_index do |arg, i|
      arg.each_with_index do |el, j|
        output[j][i+1] = el if j < self.length
      end
    end

    
    output
  end

  def my_rotate(val=1)
    if val > 0
      val.times do
        self.push((self.shift()))
      end
    else
      (val.abs).times do
        self.unshift(self.pop())
      end
    end
    
    self
  end

  def my_join(separator='')
    output =''
    self.each {|el| output += (el + separator)}
    output
  end

  def my_reverse
    return self if self.length == 1

    (self[1..-1]).my_reverse + [self.first]
  end
end


a = [4,5,6]
b = [7,8,9]
c = [10,11,12]
d = [13,14,15]

# p [1,2,3].my_zip(a,b) # => [1,2,3,4,5]
# p [1,2].my_zip(a,b) # => [1,2,3,4,5]
# p a.my_zip([1,2], [8]) # => [1,2,3,4,5]
# p [1,2].my_zip(a,b,c,d) # => [1,2,3,4,5]

# p %w(a b c d).my_rotate
# p %w(a b c d).my_rotate(2)
# p %w(a b c d).my_rotate(-3)
# p %w(a b c d).my_rotate(15)

# p %w(a b c d).my_join
# p %w(a b c d).my_join('$')

# p %w(a b c).my_reverse
# p [1].my_reverse
# p [1,2,3,4,5,6,7,8,9,10].my_reverse



def factors(num)
end

def bubble_sort!(%prc)
end

def bubble_sort(%prc)
end

def substrings(str)
end

def subwords(word, dictionary)
end


