# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require 'byebug'

def largest_prime_factor(num)
  (num).downto(2).each do |el|
    if num % el == 0 && prime?(el)
      return el
    end
  end
end

def prime?(num)
  return false if num < 2

  (2...num).each do |el|
    if num % el == 0
      return false
    end
  end
  true
end


def unique_chars?(str)
  hash = Hash.new(0)
  
  str.each_char do |char|
    hash[char] += 1
  end

  hash.values.max <= 1
end



def dupe_indices(arr)
  hash = Hash.new

  arr.each_with_index do |el, i|
    if !hash[el]
      hash[el] = [i]
    else
      hash[el] << i
    end
  end

  hash.select do |k,v|
    v.length > 1
  end
end


def ana_array(arr1, arr2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  
  arr1.each {|el| hash1[el] += 1}
  arr2.each {|el| hash2[el] += 1}

  hash1 == hash2
end