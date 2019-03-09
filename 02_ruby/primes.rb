# require 'byebug'

# primes.rb

def prime?(num)
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
  while ps.count < num_primes
    ps << num if prime?(num)
    num += 1
  end
end

if __FILE__ == $PROGRAM_NAME
  puts primes(100)
end




def return_childs_retirement_savings(your_age)
    childs_age = your_age / 2
    childs_bank_account = childs_age ** 2
    years_until_childs_retirement = 65 - childs_age

    childs_bank_account * years_until_childs_retirement
end