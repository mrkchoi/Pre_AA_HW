

# average
def average(num1, num2)
    (num1 + num2) / 2.to_f
end


# average_array
def average_array(arr)
    arr.sum / arr.length.to_f
end

# repeat
def repeat(str, num)
    str * num
end

# yell
def yell(str)
    str.upcase + '!'
end

# alternating_case
def alternating_case(str)
    str_arr = str.split.map.with_index do |el, i|
        if i.even?
            el.upcase
        else
            el.downcase
        end
    end
    str_arr.join(' ')
end