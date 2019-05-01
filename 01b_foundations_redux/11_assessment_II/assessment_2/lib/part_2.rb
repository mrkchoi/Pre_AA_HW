
# proper_factors
def proper_factors(num)
    factors = []
    (1...num).each {|el| (factors << el) if num % el == 0}
    factors
end

# aliquot_sum
def aliquot_sum(num)
    proper_factors(num).sum
end

# perfect_number?
def perfect_number?(num)
    aliquot_sum(num) == num
end

# ideal_numbers
def ideal_numbers(n)
    perfect_numbers = []
    i = 1
    while perfect_numbers.length < n
        (perfect_numbers << i) if perfect_number?(i)
        i += 1
    end
    perfect_numbers
end
