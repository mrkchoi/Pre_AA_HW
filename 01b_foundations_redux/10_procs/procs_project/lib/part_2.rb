def reverser(str, &prc)
  prc.call(str.reverse)
end

def word_changer(str, &prc)
  str_arr = str.split
  str_arr.map! do |el|
    prc.call(el)
  end
  str_arr.join(' ')
end

def greater_proc_value(num, prc1, prc2)
  prc1.call(num) > prc2.call(num) ? prc1.call(num) : prc2.call(num)
end

def and_selector(arr, prc1, prc2)
  output = []
  arr.each do |el|
    if prc1.call(el) && prc2.call(el)
      output << el
    end
  end   
  output
end

def alternating_mapper(arr, prc1, prc2)
  arr.map.with_index do |el, i|
    if i.even?
      prc1.call(el)
    else
      prc2.call(el)
    end
  end
end