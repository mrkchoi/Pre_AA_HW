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




