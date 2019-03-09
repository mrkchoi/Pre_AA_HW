require 'byebug'

# primes.rb
def prime?(num)
    # debugger
    if num < 2
        return false
    end
  (2...num).each do |idx|
    if num % idx == 0
      return false
    end
  end

  true
end

def primes(num_primes)
    debugger
  ps = []
  num = 1
  while num <= num_primes
    ps << num if prime?(num)
    num += 1
  end
  ps
end

if $PROGRAM_NAME == __FILE__
    puts primes(100)
end

