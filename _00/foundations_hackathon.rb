# Foundations Hackathon Coding Challenges

# 1) Given an array of characters & one word, find out if the word can be made from these characters.

def valid_word?(chars, word)
  return false if chars.length < word.length

  word_hash = Hash.new(0)
  chars_hash = Hash.new(0)

  word.each_char {|el| word_hash[el] += 1}
  chars.each {|el| chars_hash[el] += 1}

  word_hash.each do |k,v|
    return false if !chars_hash.has_key?(k) || chars_hash[k] < v
  end

  true
end

word = "orange"
characters = %w(e n g a r o)
p valid_word?(characters, word) #true
p valid_word?(%w(h e l o), 'hello') #false

# # 2) Given a number represented as a binary string, find out how many operations it will take to reduce it to zero using the following rules:
# #       - if it is even, divide by 2
# #       - if it is odd, subract 1


# num = "10100110"
# reach_zero(num) #12

# # 3) Given a 2D array filled with letters, determine if there is any 2x2 square composed entirely of vowels and return the top left position
# #       (row-column) of the square. 



# input = [["a","q","r","s","t"], ["u","k","a","e","i"], ["f","f","o","o","o"]]
# #       a q r s t
# #       u k a e i
# #       f f o o o
# vowel_square(input) #[1,2]