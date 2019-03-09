# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
    output_str = ''

    str.each_char do |char|
        if char.upcase == char
            output_str += char
        end
    end
    output_str
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
    output_str = ''

    if str.length % 2 == 1
        odd_i = str.length / 2
        output_str += str[odd_i]
    else
        even_i1 = str.length / 2 - 1
        even_i2 = (str.length / 2)

        output_str += str[even_i1]
        output_str += str[even_i2]
    end

    output_str
end

# middle_substring('hello') => 'l'
# middle_substring('hell') => 'el'

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
    count = 0

    str.each_char do |char|
        if VOWELS.include?(char)
            count += 1
        end
    end

    count
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
    output = 1
    (1..num).each {|el| output *= el}
    output
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
    output_str = arr[0].to_s
    arr.each do |el|
        if el != arr[0]
            output_str += (separator.to_s + el.to_s)
        end
    end

    output_str
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
    output_str = ''
    str.each_char.with_index do |el, i|
        if i % 2 == 0
            output_str += el.downcase
        else
            output_str += el.upcase
        end
    end

    output_str
end

# Reverse all words of five or more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
    str_arr = str.split(' ')
    output_arr = []

    str_arr.each do |word|
        if word.length >= 5
            output_arr << word.reverse
        else
            output_arr << word
        end
    end

    output_arr.join(' ')
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
    output_arr = []

    (1..n).each do |num|
        if num % 5 == 0 && num % 3 == 0
            output_arr << 'fizzbuzz'
        elsif num % 5 == 0
            output_arr << 'buzz'
        elsif num % 3 == 0
            output_arr << 'fizz'
        else
            output_arr << num
        end
    end

    output_arr
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
    arr.reverse
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
    if num < 2
        return false
    end

    (2...num).each do |el|
        if num % el == 0
            return false
        end
    end
    true
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
    output_arr = []

    (1..num).each do |el|
        if num % el == 0
            output_arr << el
        end
    end

    output_arr.sort
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
    all_factors = factors(num)
    output_arr = []

    all_factors.each do |el|
        if prime?(el)
            output_arr << el
        end
    end

    output_arr.sort
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
    prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
    odds = []
    evens = []

    arr.each do |el|
        if el.even?
            evens << el
        else
            odds << el
        end
    end
    if odds.length < evens.length
        print odds[0]
        return odds[0]
    else
        print evens[0]
        return evens[0]
    end
end

oddball([1,3,4,5])
