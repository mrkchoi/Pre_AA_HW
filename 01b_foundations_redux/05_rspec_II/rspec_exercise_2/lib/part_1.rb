
def partition(arr, num)
  output = [[], []]

  arr.each do |el|
    if el < num
      output[0] << el
    else
      output[1] << el
    end
  end

  output
end

def merge(hash1, hash2)
  hash1.merge(hash2)
end

def censor(str, dict)
  vowels = %w(a e i o u)
  str_arr = str.split(' ')

  str_arr.each do |word|
    if dict.include?(word.downcase)
      word.each_char.with_index do |char, i|
        word[i] = '*' if vowels.include?(char.downcase)
      end
    end
  end
  str_arr.join(' ')
end

def power_of_two?(num)
  return true if num == 1
  return false if num.odd?

  while num % 2 == 0
    num = num / 2
  end

  return true if num == 1
  false
end
