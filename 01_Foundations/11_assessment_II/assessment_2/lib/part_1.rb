

# my_reject
def my_reject(arr, &prc)
    new_arr = []
    arr.each {|el| (new_arr << el) if prc.call(el) == false}
    new_arr
end

# my_one?
def my_one?(arr, &prc)
    check = []
    arr.each {|el| (check << el) if prc.call(el)}
    check.length == 1
end

# hash_select
def hash_select(hash, &prc)
    new_hash = {}
    hash.each {|k,v| (new_hash[k] = v) if prc.call(k,v)}
    new_hash
end

# xor_select
def xor_select(arr, prc_1, prc_2)
    new_arr = []
    arr.each do |el|
        if prc_1.call(el) && !prc_2.call(el)
            new_arr << el
        elsif !prc_1.call(el) && prc_2.call(el)
            new_arr << el
        end
    end
    new_arr
end

# proc_count
def proc_count(num, arr)
    count = 0
    arr.each {|prc| (count += 1) if prc.call(num)}
    count
end
