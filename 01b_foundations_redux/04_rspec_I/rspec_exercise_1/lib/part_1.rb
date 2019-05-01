

def average(num1, num2)
  (num1 + num2) / 2.to_f
end

def average_array(arr)
  (arr.inject {|acc, el| acc + el}) / arr.length.to_f
end

def repeat(str, num)
  output = ''
  num.times {output += str}
  output
end

def yell(str)
  str.upcase + '!'
end

def alternating_case(str)
  str_arr = str.split(' ')
  str_arr.map!.with_index {|el, i| i.even? ? el.upcase : el.downcase}
  str_arr.join(' ')
end