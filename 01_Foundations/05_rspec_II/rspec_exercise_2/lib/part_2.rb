require 'byebug'

# palindrome?
def palindrome?(str)
    return true if str.length == 1
    str.each_char.with_index {|char, i| return false if str[i] != str[(str.length - 1) - i]}
    true
end

# substrings
def substrings(str)
    output = []
    (0...str.length).each do |start_idx|
        (start_idx...str.length).each do |end_idx|
            output << str[start_idx..end_idx]
        end 
    end
    output
end

# palindrome_substrings
def palindrome_substrings(str)
    substrings(str).select {|el| el.length > 1 && palindrome?(el)}
end

