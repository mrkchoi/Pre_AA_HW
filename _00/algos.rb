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


p is_unique('hello') # => false
p is_unique('abcdef') # => true
p is_unique('aaaaaaaaaaa') # => false
p is_unique('abcdefghijklmnopqrstuvwxyz') # => true
p is_unique('this may be un1q') # => false