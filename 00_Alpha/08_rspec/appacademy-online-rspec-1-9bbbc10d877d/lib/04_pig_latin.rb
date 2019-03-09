
def translate(str)
    str_arr = str.split(' ')
    output_arr = []

    str_arr.each do |word|
        output_arr << pig_latin(word)
    end

    output_arr.join(' ')
end

def pig_latin(str)
    str_arr = str.split('')
    vowels = 'aeiou'

    # If word begins with vowel, add 'ay' to end
    if vowels.include?(str_arr[0])
        return str + 'ay'
    elsif !str.include?('qu')
        until vowels.include?(str_arr[0])
            str_arr.push(str_arr.shift)
        end        
        return str_arr.join('') + 'ay'
    else
        qu_idx = str.index('qu') + 1
        new_str = str[(qu_idx + 1)..-1] + str[0..qu_idx] + 'ay'
        new_str
    end
end