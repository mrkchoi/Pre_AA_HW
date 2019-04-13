require 'byebug'

# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end


# def add_two_numbers(l1, l2)
#   first = []
#   second = []
  
  
# end



# def is_valid(s)
#   str_arr = s.chars
#   valid_check = false

#   hash = Hash.new(0)

#   str_arr.each do |el|
#     hash[el] += 1
#   end

#   if hash['('] > 0
#     if (hash['('] == hash[')'])
#       valid_check = true;
#     else
#       valid_check = false;
#     end
#   end

#   if hash['['] > 0
#     if (hash['['] == hash[']'])
#       valid_check = true;
#     else
#       valid_check = false;
#     end
#   end

#   if hash['{'] > 0
#     if (hash['{'] == hash['}'])
#       valid_check = true;
#     else
#       valid_check = false;
#     end
#   end

#   if str_arr.include?('(') && str_arr.include?(')')
#     if str_arr.index('(') > str_arr.index(')') 
#       valid_check = false;
#     end
#   end

#   if str_arr.include?('[') && str_arr.include?(']')
#     if str_arr.index('[') > str_arr.index(']') 
#       valid_check = false;
#     end
#   end

#   if str_arr.include?('{') && str_arr.include?('}')
#     if str_arr.index('{') > str_arr.index('}') 
#       valid_check = false;
#     end
#   end

#   return valid_check
# end

# p is_valid('()[]{}') # => true
# p is_valid(')(') # => false
# p is_valid('(()()))') # => false





# def is_valid(s)
#   debugger
#   pairs = {
#     ')' => '(',
#     ']' => '[',
#     '}' => '{'
#   }

#   stack = []

#   (0...s.length).each do |i|
#     current = s[i]

#     if match = pairs[current]
#       return false if stack.pop != match
#     else
#       stack.push(current)
#     end
#   end
  
#   return stack.empty?
# end














# def is_valid(s)

# end






# # p is_valid('([)]')
# p is_valid('([]{})')
# # ['(', '[']

























# def sockMerchant(n, arr)
#   hash = Hash.new(0)
#   count = 0

#   arr.each do |el|
#     hash[el] += 1  
#   end

#   hash.each do |k, v|
#     count += (v / 2) if v > 1
#   end

#   count
# end

# # sockMerchant(5, [1,2,1,2,3]) => 2 (pairs)
# p sockMerchant(5, [1,2,1,2,3,3,3,2,1])
# p sockMerchant(9, %w(10 20 20 10 10 30 50 10 20))







# def countingValleys(n,s)
#   elevation = 0
#   valleys = 0

#   s.chars do |el|
#     if el == 'U'
#       elevation += 1
#     elsif el == 'D'
#       elevation -= 1
#     end

#     (valleys += 1) if el == 'U' && elevation == 0
#   end

#   valleys
# end

# p countingValleys(8, 'UDDDUDUU') # => 1
# p countingValleys(8, 'DDUUDDUUDDUUUUDD') # => 1




# def jumpingOnClouds(c)
#   current = 0
#   jumps = 0

#   c.each_with_index do |el, i|
#     next if i < current || el == 1

#     if c[i + 2] == 0
#       current = i + 2
#       jumps += 1
#     elsif c[i + 1] == 0
#       current = i + 1
#       jumps += 1
#     end
#   end

#   jumps
# end

# p jumpingOnClouds([0,0,1,0,0,1,0]) # => 4
# p jumpingOnClouds([0,0,0,0,1,0]) # => 3


















# def repeatedString(s, n)
#   last_length = n % s.length
#   last_repeat = s.slice(0, last_length)

#   num_complete_repeats = n / s.length

#   full_hash = Hash.new(0)
#   partial_hash = Hash.new(0)

#   s.chars {|el| full_hash[el] += 1}

#   last_repeat.chars {|el| partial_hash[el] += 1}

#   single_a_count = full_hash['a']
#   partial_a_count = partial_hash['a']

#   (single_a_count * num_complete_repeats) + partial_a_count
# end

# p repeatedString('aba', 10) # => 7
# p repeatedString('a', 100) # => 100




# def hourglassSum(arr)
#   sums = []

#   i = 0
#   while i < 4
#     j = 0
#     while j < 4
#       top = arr[i][j] + arr[i][j + 1] + arr[i][j + 2]
#       mid = arr[i + 1][j + 1]
#       bottom = arr[i + 2][j] + arr[i + 2][j + 1] + arr[i + 2][j + 2]

#       total = top + mid + bottom

#       sums << total
#       j += 1
#     end
#     i += 1
#   end
#   sums.max
# end



# input = [
#   [1,1,1,1,0,1],
#   [0,1,0,1,0,1],
#   [1,1,1,1,0,1],
#   [0,1,0,2,2,2],
#   [0,1,0,1,2,1],
#   [0,1,0,2,2,2]
# ]
# p hourglassSum(input) # => 7


def twoStrings(s1, s2)
  s1.each_char do |char|
    return 'YES' if s2.include?(char)
  end
  'NO'
end


p twoStrings('hello', 'world') # => YES
p twoStrings('hi', 'world') # => NO