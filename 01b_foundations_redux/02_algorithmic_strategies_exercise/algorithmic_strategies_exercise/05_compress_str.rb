# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".



def compress_str(str)
  compressed = ''

  count = 1
  str.each_char.with_index do |char, i|
    
    if i < str.length - 1
      if str[i] == str[i+1]
        count += 1
      elsif str[i] != str[i+1] && count > 1
        compressed += "#{count}#{str[i]}"
        count = 1
      else
        compressed += char
      end
    else
      if str[i - 1] == str[i]
        compressed += "#{count}#{str[i]}"
      else 
        compressed += char
      end
    end
    
  end
  compressed
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
