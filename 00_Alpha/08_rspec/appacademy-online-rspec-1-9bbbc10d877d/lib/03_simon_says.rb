
def echo(str)
    str
end

def shout(str)
    str_arr = str.split(' ')
    output_arr = []

    str_arr.each do |word|
        output_arr << word.upcase
    end
    output_arr.join(' ')
end

def repeat(str, times=2)
    output_arr = []

    times.times do
        output_arr << str
    end

    output_arr.join(' ')
end

def start_of_word(str, num=1)
    str[0,num]
end

def first_word(str)
    str_arr = str.split(' ')
    str_arr[0]
end

def titleize(str)
    str_arr = str.split(' ')
    output_arr = []
    vowels = 'aeiou'

    str_arr.each_with_index do |word, i|
        # Always capitalize the first letter of the string
        if i == 0
            output_arr << word.capitalize
        # If wordlength is 4 or less && it does NOT start with a vowel => capitalize
        elsif word.length <= 4 && vowels.include?(word[0])
            output_arr << word
        # If wordlength is 3 or less
        elsif word.length <= 3
            output_arr << word
        else
            # Capitalize the first letter of each word
            output_arr << word.capitalize
        end
    end
    output_arr.join(' ')
end


