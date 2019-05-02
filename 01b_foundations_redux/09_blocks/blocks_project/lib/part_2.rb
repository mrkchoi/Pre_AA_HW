

def all_words_capitalized?(arr)
  arr.all? do |el|
    el == el.capitalize
  end
end