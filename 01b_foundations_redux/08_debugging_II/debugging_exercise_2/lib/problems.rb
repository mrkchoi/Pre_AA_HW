# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require 'byebug'

# largest_prime_factor
def largest_prime_factor(num)
    num.downto(2) {|el| return el if (num % el == 0) && (is_prime?(el))}
end

def is_prime?(num)
    return false if num < 2
    (2...num).none? {|el| num % el == 0}
end


# unique_chars?
def unique_chars?(str)
    hash = Hash.new(0)
    str.each_char {|char| hash[char] += 1}
    !hash.any? {|k,v| v > 1}
end

# dupe_indices
def dupe_indices(arr)
    indices = Hash.new {|hash, k| hash[k] = []}
    arr.each_with_index {|el, i| indices[el] << i}
    indices.select {|el, arr| arr.length > 1}
end


# ana_array
def ana_array(arr1, arr2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    arr1.each {|el| hash1[el] += 1}
    arr2.each {|el| hash2[el] += 1}
    hash1 == hash2
end

