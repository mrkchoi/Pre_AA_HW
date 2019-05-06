

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


p perms('abc') # => ['abc', 'acb', 'cab', 'bca', 'bac', 'cba']
