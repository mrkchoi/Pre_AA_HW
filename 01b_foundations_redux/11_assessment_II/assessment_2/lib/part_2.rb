
def proper_factors(num)
  output = []
  (1...num).each do |cur|
    if num % cur == 0
      output << cur
    end
  end
  output
end

def aliquot_sum(num)
  factors = proper_factors(num)
  factors.sum
end

def perfect_number?(num)
  num == aliquot_sum(num)
end

def ideal_numbers(num)
  output = []

  i = 2
  until output.length == num
    if perfect_number?(i)
      output << i
    end
    i += 1
  end

  output
end