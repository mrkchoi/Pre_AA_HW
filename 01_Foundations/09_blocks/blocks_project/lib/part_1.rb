

# select_even_nums
def select_even_nums(arr)
    arr.select(&:even?)
end

# reject_puppies
def reject_puppies(arr)
    arr.reject {|hash| hash['age'] < 3}
end

# count_positive_subarrays

def count_positive_subarrays(arr)
    arr.count {|sub_arr| sub_arr.sum > 0}
end


# aba_translate
def aba_translate(str)
    output_str = ''

    str.each_char do |char|
        if 'aeiou'.include?(char)
            output_str += char + 'b' + char
        else
            output_str += char
        end
    end
    
    output_str
end

# aba_array
def aba_array(arr)
    arr.map {|el| aba_translate(el)}
end
