class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    arr_as_kv_pair = ''

    self.each_with_index do |el, i|
      arr_as_kv_pair += i.to_s(2) + el.to_s(2)
    end

    arr_as_kv_pair.to_i(2).hash
  end
end

# require 'byebug'

class String
  def hash
    # => 'hello world'
    alpha = ('a'..'z').to_a
    alpha << ' '
    xor = 0

    self.each_char.with_index do |char, i|
      bit_idx = i.to_s.to_i.hash
      bit_char = alpha.index(char).to_s.to_i.hash
      xor = bit_idx.hash ^ bit_char.hash
    end

    xor
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method

  # => {:a => 1, :b=> 2, :c=> 3}

  def hash
    alpha = ('a'..'z').to_a
    hash_as_arr = []

    self.each do |k, v|
      hash_as_arr << [k, v]  
    end

    hash_as_arr.sort!
    hash_as_arr.flatten!

    hash_as_arr.map! do |el|
      if el.is_a?(Symbol)
        alpha.index(el.to_s)
      elsif el.is_a?(Integer)
        el
      elsif el.is_a?(String)
        alpha.index(el)
      end
    end
    hash_as_arr.sum.hash
  end
end


# class Hash
#   # This returns 0 because rspec will break if it returns nil
#   # Make sure to implement an actual Hash#hash method
#   def hash
#     hash_val = 0
#     self.each do |k, v|
#       hash_val += k.hash + (v.hash * 2)
#     end
#     hash_val
#   end
# end