

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

p count_primes(100)