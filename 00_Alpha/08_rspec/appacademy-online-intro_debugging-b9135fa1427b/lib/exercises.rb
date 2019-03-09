require 'byebug'

# Write a method that capitalizes each word in a string like a book title
# Do not capitalize words like 'a', 'and', 'of', 'over' or 'the'.

LITTLE_WORDS = [
  "and",
  "the",
  "over"
]

def titleize(title)
  words = title.split(" ")
  titleized_words = words.map.with_index do |word, i|
    if i == 0
      word.capitalize
    elsif LITTLE_WORDS.include?(word) || word.length < 4
      word.downcase
    else
      word.capitalize
    end
  end

  titleized_words.join(" ")
end


# Write a method that returns the largest prime factor of a given integer.

def prime?(num)
    # debugger
    if num < 2
      return false
    end
  (2...num).each do |factor| 
    if num % factor == 0
      return false
    end
  end
    true
end

def largest_prime_factor(num)
  # debugger
  num.downto(2) do |factor|
    if (num % factor).zero?
      return factor if prime?(factor)
    end
  end
  return nil
end


# Write a symmetric_substrings method that takes a string and returns an array
# of substrings that are palindromes, e.g. symmetric_substrings("cool") => ["oo"]
# Only include substrings of length > 1.

def symmetric_substrings(str)
  # debugger
  symm_subs = []

  (str.length).times do |start_pos|
    (2..(str.length - start_pos)).each do |len|
      substr = str[start_pos...(start_pos + len)]
      symm_subs << substr if substr == substr.reverse
    end
  end

  symm_subs
end


# Write a method that returns `true` if all characters in the string
# are unique and `false` if they are not.

def all_unique_chars?(str)
  # debugger
  letters = str.split('').reject{ |char| char == ' '}
  letters.uniq.length == letters.length
end

# def reject_chars(arr)
#   rejected_arr = arr.reject do |el|
#     el == ' '
#   end
#   print rejected_arr
#   print arr
# end


# reject_chars(['a','b','c',' '])
# puts