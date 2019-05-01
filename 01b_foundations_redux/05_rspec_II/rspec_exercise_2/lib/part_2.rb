
def palindrome?(str)
  str.each_char.with_index do |char, i|
    return false if str[i] != str[-1 - i]
  end
  true
end

def substrings(str)
  output = []

  i = 0
  while i < str.length
    j = 1
    while j <= str.length
      output << str.slice(i, j) 
      j += 1
    end
    i += 1
  end
  output.uniq
end

def palindrome_substrings(str)
  sub_str = substrings(str)
  sub_str.select! {|el| el.length > 1 && palindrome?(el)}
end

