require 'byebug'

# hipsterfy
def hipsterfy(word)
    vowels = 'aeiou'

    i = word.length - 1
    while i >= 0
        if vowels.include?(word[i])
            return word[0...i] + word[(i + 1)..-1]
        end
        i -= 1
    end
    word
end

# vowel_counts
def vowel_counts(str)
    vowels = 'aeiou'
    hash = Hash.new(0)
    str.downcase.each_char {|char| (hash[char] += 1) if vowels.include?(char)}
    hash
end

# caesar_cipher
def caesar_cipher(str, num)
    alpha = ('a'..'z').to_a
    output = ''

    str.each_char do |el|
       if alpha.include?(el) 
            output += alpha[(alpha.index(el) + num) % 26]
       else
            output += el
       end
    end
    output
end