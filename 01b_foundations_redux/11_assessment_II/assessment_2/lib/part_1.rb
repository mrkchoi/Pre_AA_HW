
def my_reject(arr, &prc)
  output = []
  arr.each do |el|
    if !prc.call(el)
      output << el
    end
  end
  output
end

def my_one?(arr, &prc)
  count = 0

  arr.each do |el|
    if prc.call(el)
      count += 1
    end
  end
  count == 1
end

def hash_select(hash, &prc)
  output = {}
  hash.each do |k,v|
    if prc.call(k,v)
      output[k] = v
    end
  end
  output
end

def xor_select(arr, prc1, prc2)
  output = []
  arr.each do |el|
    if prc1.call(el) && prc2.call(el)
      next
    elsif prc1.call(el) ^ prc2.call(el)
      output << el
    end
  end
  output
end

def proc_count(val, arr)
  count = 0

  arr.each do |prc|
    if prc.call(val)
      count += 1
    end
  end
  count
end