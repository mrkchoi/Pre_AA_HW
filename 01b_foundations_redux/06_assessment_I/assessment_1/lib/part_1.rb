def is_prime?(num)
  return false if num < 2

  (2...num).each do |el|
    return false if num % el == 0
  end
  true
end

def nth_prime(num)
  count = 0
  
  i = 0
  while count < num
    if is_prime?(i)
      count += 1
      return i if count == num
    end
    i += 1
  end
end

def prime_range(min, max)
  output = []
  (min..max).each {|el| output << el if is_prime?(el)}
  output
end