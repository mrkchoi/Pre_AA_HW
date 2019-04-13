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


# def twoStrings(s1, s2)
#   s1.each_char do |char|
#     return 'YES' if s2.include?(char)
#   end
#   'NO'
# end


# p twoStrings('hello', 'world') # => YES
# p twoStrings('hi', 'world') # => NO




# def maximumToys(prices, k)
#   count = 0
#   sorted_prices = prices.sort

#   sorted_prices.each do |el|
#     if el <= k
#       count += 1
#       k -= el
#     else
#       break
#     end
#   end
  
#   count
# end

# p maximumToys([1,12,5,111,200,1000,10], 50) # => 4






# def countSwaps(a)
#   num_swaps = 0
#   swapped = true

#   while swapped
#     swapped = false
#     i = 0

#     while i < a.length - 1
#       if a[i] > a[i + 1]
#         a[i], a[i + 1] = a[i + 1], a[i]
#         num_swaps += 1
#         swapped = true
#       end
#       i += 1
#     end
#   end

#   print "Array is sorted in #{num_swaps} swaps.\n"
#   print "First Element: #{a[0]}\n"
#   print "Last Element: #{a[-1]}\n"
# end

# p countSwaps([3,2,1]) # => 3, 1, 3
# p countSwaps([1,2,3]) # => 3, 1, 3
# p countSwaps([7,6,5,4,3,2,1]) # => 3, 1, 3








# def makeAnagram(s1, s2)
#   deletion_count = 0

#   hash1 = Hash.new(0)
#   hash2 = Hash.new(0)

#   s1.each_char {|char| hash1[char] += 1}
#   s2.each_char {|char| hash2[char] += 1}

#   hash1.each do |k,v|
#     if hash2[k] == 0
#       deletion_count += v
#       hash1.delete(k)
#     elsif hash1[k] > hash2[k]
#       deletion_count += (hash1[k] - hash2[k])
#       hash1.delete(k)
#       hash2.delete(k)
#     elsif hash1[k] < hash2[k]
#       deletion_count += (hash2[k] - hash1[k])
#       hash1.delete(k)
#       hash2.delete(k)
#     end
#   end

#   hash2.each do |k,v|
#     if hash1[k] == 0
#       deletion_count += v
#     elsif hash2[k] > hash1[k]
#       deletion_count += (hash2[k] - hash1[k])
#     elsif hash2[k] < hash1[k]
#       deletion_count += (hash1[k] - hash2[k])
#     end
#   end

#   deletion_count
# end



# p makeAnagram('abc', 'cde') # => 4
# p makeAnagram('bacdc', 'dcbad') # => 2
# p makeAnagram('fcrxzwscanmligyxyvym', 'jxwtrhvujlmrpdoqbisbwhmgpmeoke') # => 30


# def reverse(x)

#   if x >= 0
#     reversed = x.to_s.chars.reverse.join.to_i
#   elsif x < 0
#     x_arr = x.to_s.chars
#     x_arr.shift
#     reversed = x_arr.reverse.join.to_i
#     reversed *= -1
#   end

#   # debugger


#   # CHECK WITHIN RANGE FOR REVERSED INTEGER
#   return 0 if reversed < (-2**31) || reversed > (2**31 - 1)
#   reversed
# end

# # p reverse(123) # => 321
# p reverse(-123) # => -321
# p reverse(120) # => 21
# p reverse((2**31 + 2)) # => 0
# p reverse(-(2**31)) # => 0







# def is_palindrome(x)
#   x.to_s.chars == x.to_s.chars.reverse
# end


# p is_palindrome(121) # => true
# p is_palindrome(-121) # => false
# p is_palindrome(10) # => false










def roman_to_int(num)
  output = ''
  romans = {
    "M"  => 1000,
    "CM"  => 900,
    "D"  => 500,
    "CD"  => 400,
    "C"  => 100,
    "XC"  => 90,
    "L"  => 50,
    "XL"  => 40,
    "X"  => 10,
    "IX"  => 9,
    "V"  => 5,
    "IV"  => 4,
    "I" => 1
  }

  until num == 0
    romans.each do |k,v|
      if romans[k].to_i <= num.to_i
        output += k
        num -= romans[k]
      end
    end
  end

  output
end




p roman_to_int(3) # => "III"
p roman_to_int(4) # => "IV"
p roman_to_int(9) # => "IX"
p roman_to_int(58) # => "LVIII"
p roman_to_int(1994) # => "MCMXCIV"


