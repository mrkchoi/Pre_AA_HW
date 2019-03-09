


def prime?(num)
    return false if num < 2

    (2...num).each do |i|
        return false if num % i == 0
    end
    
    true
end


# TDD Iteration 1: Return false if the number is not prime
p prime?(6) # => false
p prime?(8) # => false
p prime?(9) # => false

# TDD Iteration 2: Return true if the number is prime
p prime?(2) # => true
p prime?(5) # => true
p prime?(7) # => true
p prime?(11) # => true

# TDD Iteration 3: Return false if number is less than 2
p prime?(1) # => false
p prime?(0) # => false
p prime?(-10) # => false