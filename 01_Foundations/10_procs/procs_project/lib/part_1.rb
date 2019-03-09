

# my_map
def my_map(arr, &prc)
    new_arr = []
    arr.each {|el| new_arr << prc.call(el)}
    new_arr
end


# my_select
def my_select(arr, &prc)
    new_arr = []
    arr.each {|el| (new_arr << el) if prc.call(el) == true}
    new_arr
end

# my_count
def my_count(arr, &prc)
    count = 0
    arr.each {|el| (count += 1) if prc.call(el)}
    count
end

# my_any?
def my_any?(arr, &prc)
    arr.each {|el| return true if prc.call(el)}
    false
end

# my_all?
def my_all?(arr, &prc)
    arr.each {|el| return false if !prc.call(el)}
    true
end

# my_none?
def my_none?(arr, &prc)
    arr.each {|el| return false if prc.call(el)}
    true
end

