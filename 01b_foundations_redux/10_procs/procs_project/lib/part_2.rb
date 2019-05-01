# reverser
def reverser(str, &prc)
    prc.call(str.reverse)
end

# word_changer
def word_changer(str, &prc)
    new_arr = []
    str.split.each {|el| new_arr << prc.call(el)}
    new_arr.join(' ')
end

# greater_proc_value
def greater_proc_value(num, prc_1, prc_2)
    if prc_1.call(num) > prc_2.call(num)
        return prc_1.call(num) 
    else
        return prc_2.call(num) 
    end
end

# and_selector
def and_selector(arr, prc_1, prc_2)
    new_arr = []
    arr.each {|el| (new_arr << el) if prc_1.call(el) && prc_2.call(el)}
    new_arr
end

# alternating_mapper
def alternating_mapper(arr, prc_1, prc_2)
    new_arr = []
    arr.each do |el|
        if arr.index(el).even?
            new_arr << prc_1.call(el)
        else
            new_arr << prc_2.call(el)
        end
    end
    new_arr
end

