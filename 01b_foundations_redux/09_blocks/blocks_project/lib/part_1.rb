
def select_even_nums(arr)
  arr.select do |el|
    el.even?
  end
end

def reject_puppies(arr)
  arr.reject do |el|
    el['age'] <= 2
  end
end

def count_positive_subarrays(arr)
  arr.map! do |el|
    el.sum
  end

  arr.count do |el|
    el > 0
  end
end

def aba_translate(str)
  vowels = %w(a e i o u)
  str = str.chars

  str.each_with_index do |el, i|
    if vowels.include?(el)
      str[i] = "#{el}b#{el}"
    end
  end
  str.join('')
  
end

def aba_array(arr)
  arr.map do |el|
    aba_translate(el)
  end
end