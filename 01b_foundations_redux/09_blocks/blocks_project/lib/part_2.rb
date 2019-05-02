

def all_words_capitalized?(arr)
  arr.all? do |el|
    el == el.capitalize
  end
end

def no_valid_url?(arr)
  valid_urls = ['.com','.net','.io','.org']

  arr.none? do |el|
    tld = el.split('.')[1]
    tld = '.' + tld
    valid_urls.include?(tld)
  end
end

def any_passing_students?(arr)
  arr.any? do |student|
    (student[:grades].sum)/(student[:grades].length).to_f >= 75
  end
end