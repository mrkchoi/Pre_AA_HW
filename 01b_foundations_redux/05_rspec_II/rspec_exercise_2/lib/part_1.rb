require 'byebug'

# partition
def partition(arr, num)
    output = Array.new(2) {Array.new(0)}
    arr.each do |el|
        if el >= num
            output[1] << el
        else
            output[0] << el
        end
    end
    output
end

# merge
def merge(hash1, hash2)
    hash1.merge(hash2)
end

# censor
def censor(str, arr)
    vowels = 'aeiou'
    str_arr = str.split(' ')

    str_arr.map! do |el|
        if arr.include?(el.downcase)
            el.each_char.with_index do |char, i|
                if vowels.include?(char.downcase)
                    el[i] = '*'
                end
            end
            el
        end
        el
    end
    str_arr.join(' ')
end

# power_of_two?

def power_of_two?(num)
    (0..num).each {|power| return true if 2 ** power == num}
    false
end