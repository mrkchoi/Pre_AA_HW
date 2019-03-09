require 'byebug'

# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)
    arr.reduce(0) {|sum, el| sum + el}
end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_string? helper method
def in_all_strings?(long_strings, substring)
    long_strings.all? {|el| sub_string?(el, substring)}
end

def sub_string?(str, substr)
    str.include?(substr)
end

# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def non_unique_letters(string)
    hash = Hash.new(0)
    str_arr = string.split('')
    str_arr.each do |word|
        if word != ' '
            hash[word] += 1
        end
    end

    repeat_hash = hash.select do |k,v|
        v > 1
    end
    repeat_hash.map {|el| el[0]}
end

# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)
    str_arr = string.split.sort_by {|el| el.length}
    [str_arr[-2],str_arr[-1]]
end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)
    output = []

    ('a'..'z').each do |el|
        if !string.include?(el)    
            output << el
        end
    end
    output
end

# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?
def no_repeat_years(first_yr, last_yr)
    (first_yr..last_yr).reduce([]) do |output, el|
        if not_repeat_year?(el)
            output << el
        else
            output
        end
    end
end

def not_repeat_year?(year)
    year_arr = year.to_s.split('')
    hash = Hash.new(0)
    year_arr.each {|el| hash[el] += 1}
    hash.all? {|k,v| v == 1}
end

# HARD

# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?
def one_week_wonders(songs)
    one_week_wonders = songs.select {|el| no_repeats?(el, songs)}
    one_week_wonders.uniq
end

def no_repeats?(song_name, songs)
    repeats = []

    i = 0
    while i < songs.length - 1
        if songs[i] == songs[i + 1] && songs[i] == song_name
            return false
        end
        i += 1
    end
    true
end

# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.

def remove_punctuation(str)
    alpha = 'abcdefghijklmnopqrstuvwxyz '
    output_str = ''
    
    str.each_char do |char|
        if alpha.include?(char)
            output_str += char
        end
    end

    output_str
end

def c_distance(word)
    i = word.length - 1
    while i >= 0
        if word[i] == 'c'
            return (word.length - 1) - i
        end
        i -= 1
    end
    return 999
end

def for_cs_sake(str)
    stripped_str = remove_punctuation(str)
    str_arr = stripped_str.split(' ')
    c_arr = []
    
    str_arr.each_with_index do |word|
        c_arr << c_distance(word)
    end
    
    str_arr[c_arr.index(c_arr.min)]
end



# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]

def repeated_number_ranges(arr)
    output = []

    arr.each_with_index do |el, i|
        if arr[i + 1] == arr.length
            break
        end
        if output.length > 0 && arr[output[-1][-1]] == arr[i + 1]
            output[-1] << i + 1
        elsif arr[i] == arr[i + 1]
            output << [i, i + 1]
        end
    end
    final_output = []

    if output.length == 0
        return []
    end

    output.each_with_index do |el, i|
        final_output <<  [el.min, el.max]
    end
    final_output
end
print repeated_number_ranges([1,2,3,3,4,4,4])
puts
