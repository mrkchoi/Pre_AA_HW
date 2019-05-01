

def hipsterfy(str)
  vowels = %w(a e i o u)

  (str.length - 1).downto(0) do |i|
    if vowels.include?(str[i])
      str[i] = ''
      break
    end
  end
  str
end

def vowel_counts(str)
  vowels = %w(a e i o u)
  hash = Hash.new(0)
  str.each_char {|char| hash[char.downcase] += 1 if vowels.include?(char.downcase)}
  hash
end

def caesar_cipher(str, n)
  alpha = ('a'..'z').to_a

  str.each_char.with_index do |char, i|
    if alpha.include?(char)
      old_alpha_idx = alpha.index(char)
      new_i = (old_alpha_idx + n) % 26
      str[i] = alpha[new_i]
    end
  end
  str
end