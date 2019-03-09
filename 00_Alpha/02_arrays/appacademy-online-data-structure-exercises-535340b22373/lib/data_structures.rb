# EASY

# Write a method that returns the range of its argument (an array of integers).
def range(arr)
  # your code goes here
  arr.max - arr.min
end

# Write a method that returns a boolean indicating whether an array is in sorted
# order. Use the equality operator (==), which returns a boolean indicating
# whether its operands are equal, e.g., 2 == 2 => true, ["cat", "dog"] ==
# ["dog", "cat"] => false
def in_order?(arr)
  arr == arr.sort
  # your code goes here
end


# MEDIUM

# Write a method that returns the number of vowels in its argument
def num_vowels(str)
  # your code goes here
  new_str = str.downcase
  vowels ='aeiou'
  count = 0
  new_str.each_char do |char|
    if vowels.include?(char)
      count += 1
    end
  end

  count
end

# Write a method that returns its argument with all its vowels removed.
def devowel(sent)
  sent_arr = sent.split(' ')
  output_arr = []
  vowels = 'aeiou'

  sent_arr.each do |word|
    word.each_char do |char|
      if vowels.include?(char.downcase)
        word.delete!(char)
      end
    end
    output_arr << word
  end

  output_arr.join(' ')
end


# HARD

# Write a method that returns an array of the digits of a
# non-negative integer in descending order and as strings, e.g.,
# descending_digits(4291) #=> ["9", "4", "2", "1"]
def descending_digits(int)
  # your code goes here
  int.to_s.split('').sort.reverse
end

# Write a method that returns a boolean indicating whether a string has
# repeating letters. Capital letters count as repeats of lowercase ones, e.g.,
# repeating_letters?("Aa") => true
def repeating_letters?(str)
  # your code goes here
  # new_str = str.downcase
  # hash = Hash.new(0)

  # new_str.each_char do |char|
  #   hash[char] += 1
  # end

  # hash.each do |k,v|
  #   if v > 1
  #     return true
  #   end
  # end
  # false

  str.downcase.chars.uniq.length != str.length
end

# Write a method that converts an array of ten integers into a phone number in
# the format "(123) 456-7890".
def to_phone_number(arr)
  # your code goes here
  area_code = arr[0,3].join('').to_s
  first_main = arr[3,3].join('').to_s
  second_main = arr[6,4].join('').to_s

  "(#{area_code}) #{first_main}-#{second_main}"
end

# Write a method that returns the range of a string of comma-separated integers,
# e.g., str_range("4,1,8") #=> 7
def str_range(str)
  # your code goes here
  str_arr = str.split(',')
  
  num_arr = str_arr.map do |el|
    el.to_i
  end

  sorted_num_arr = num_arr.sort

  sorted_num_arr[-1] - sorted_num_arr[0]
end


#EXPERT

# Write a method that is functionally equivalent to the rotate(offset) method of
# arrays. offset=1 ensures that the value of offset is 1 if no argument is
# provided. HINT: use the take(num) and drop(num) methods. You won't need much
# code, but the solution is tricky!
def my_rotate(arr, offset=1)
  # your code goes here
  arr.drop(offset % arr.length) + arr.take(offset % arr.length)
end










# # str = 'we belong'
# # str2 = 'together forever'

# # str.concat(' ')
# # puts str << str2



# str1 = 'hi!!!'
# str2 = str1

# puts str1
# puts str2
# puts '----------'

# str1 << ' There my friend!'

# puts str1
# puts str2
# puts '----------'
# puts str1.object_id
# puts str2.object_id
# puts '----------'
# puts str1
# puts str2


# str2 += 'You are beautiful!'
# puts '----------'
# puts str1
# puts str2
# puts str1.object_id
# puts str2.object_id





# b_and_e_artist = 'Goldilocks'
# num_bears = 3

# puts "#{b_and_e_artist} and the #{num_bears} bears"


# puts "That\'s amazing!!!"


# str = 'this is a string to work with.'

# puts str.capitalize.swapcase






# # puts 'full'.empty?
# # puts 'full'.index("u")

# str = 'mississippi'
# puts str.delete('s')
# puts str

# arr = [1,2,3,4,5]
# puts arr.count(2)


# puts :cat < :dog



# puts ["cat"][0] >= ["cat"][0]


# puts 2 <=> 3 # => -1
# puts 2 <=> 2 # => 0
# puts 3 <=> 2 # => 1


# puts false || true

# puts !!'cat'

# arr = [1,2,3,4,5]

# # puts "The array has a length of 5" if arr.length == 5
  
# print ('a'..'c').to_a
# puts



# unless 5 < 4
#   puts "Unless statement returned!"
# end


# def to_uninfinity_and_beyond
#   while true
#     puts "I'd be an infinite loop without break"
#     break
#   end
#   'reachable code'
# end

# counter = 0

# while true
#   puts "this is interation number #{counter.to_s}!"
#   counter += 1
#   break counter if counter > 10
# end


# counter = 0

# while counter < 11
#   counter += 1
#   next if counter.odd?
#   puts "I only print the even numbers between 1 and 10, including #{counter.to_s}!"
# end

# multiples = []
# i = 1
# while i <= 10
#   j = 1
#   while j <= 10
#     multiples << i * j
#     j += 1
#   end
#   i += 1
#   p multiples
# end



# def multiples(i)
#   ms = []

#   j = 1
#   while j <= i
#     ms << j * i 
#     j += 1
#   end
#   ms
# end

# i = 1
# while i <= 10
#   print multiples(i)
#   puts
#   i += 1
# end


# ('a'..'z').each do |el|
#   puts "Hi, I'm #{el}!"
# end


# (1..10).to_a.reverse.each do |el|
#   puts el * el
# end

# # ====

# 10.downto(1).each do |el|
#   puts el * el
# end




# [1,2,3].each_index do |i|
#   puts "The current index is #{i}"
# end

# 'alright alright alright'.each_char do |ch|
#   puts ch.upcase
# end
