

def is_prime?(num)
    return false if num < 2
    (2...num).each {|el| return false if num % el == 0}
    true
end

def nth_prime(n)
    primes = [2]
    i = 3

    until primes.length == n
        if is_prime?(i)
            primes << i
        end
        i += 1
    end
    primes[-1]
end

def prime_range(min, max)
    output = []
    (min..max).each do |num|
        (output << num) if is_prime?(num)
    end
    output
end
