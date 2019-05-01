# hash = {
#     'a' => 1
# }

# p hash['z']


# FOOD = 'pizza'

# def my_method(name)
#     name + ' loves ' + FOOD
# end

# p my_method('Jeff')


# def add(arr)
#     arr << 4
# end

# nums = [1,2,3]

# add(nums)

# p nums



# def add_five(num)
#     num += 5
# end

# number = 10
# add_five(number)

# p number



# two_d = Array.new(2, [])

# two_d[0] << 'a'
# two_d[1] << 'b'

# p two_d





# def save_last_vowel(word)
#     vowels = 'aeiou'
#     vowel_count = 0
#     word_arr = word.split('')

#     word.each_char do |char|
#         if vowels.include?(char)
#             vowel_count += 1
#         end
#     end

#     if vowel_count <= 1
#         return word 
#     end

#     word_arr.each_with_index do |el, i|
#         if vowels.include?(el) && vowel_count > 1
#             word_arr[i] = ''
#             vowel_count -= 1
#         end
#     end
    
#     word_arr.join('')
# end

# p save_last_vowel('bootcamp') # => 'prper'




# def num_divisors(num)
#     divisors = []
#     (1..num).each do |el|
#         if num % el == 0
#             divisors << el
#         end
#     end
#     divisors.length
# end


# p num_divisors(12)



def num_divisors(num)
    divisors = []
    (1..num).each {|el| (divisors << el) if num % el == 0}
    divisors.length
end


def anti_prime?(num)
    divisors = num_divisors(num)
    
    (1...num).each do |el|
        if num_divisors(el) >= divisors
            return false
        end
    end
    true
end


p anti_prime?(6)    # => true
p anti_prime?(12)   # => true
p anti_prime?(24)   # => true
p anti_prime?(48)   # => true

p anti_prime?(7)    # => false
p anti_prime?(16)   # => false
p anti_prime?(45)   # => false
p anti_prime?(72)   # => false








----



def save_last_vowel(word)
    vowels = 'aeiou'
    vowel_count = 0
    word_arr = word.split('')

    word.each_char {|char| (vowel_count += 1) if vowels.include?(char)}
    return word if vowel_count <= 1

    word_arr.each_with_index do |el, i|
        if vowels.include?(el) && vowel_count > 1
            word_arr[i] = ''
            vowel_count -= 1
        end
    end
    word_arr.join('')
end

def save_last_vowels(sent)
    sent_arr = sent.split.map {|el| save_last_vowel(el)}
    sent_arr.join(' ')
end



p save_last_vowels("proper")                       # => "prper"



----


