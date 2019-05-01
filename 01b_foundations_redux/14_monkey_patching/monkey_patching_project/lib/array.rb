require 'byebug'

# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        self.max - self.min
    end

    def average
        return nil if self.empty?
        self.sum.to_f / self.length 
    end

    def median
        sorted_self = self.sort
        return nil if self.empty?
        sorted_self[self.length / 2] if self.length.odd?
        (sorted_self[(self.length - 1) / 2] + sorted_self[((self.length) / 2)]) / 2.0
    end

    def counts
        counts = Hash.new(0)
        self.each {|el| counts[el] += 1}
        counts
    end

    def my_count(value)
        count = 0
        self.each {|el| (count += 1) if el == value}
        count
    end

    def my_index(value)
        return nil if my_count(value) == 0
        self.each_with_index {|el, i| return i if el == value}
    end

    def my_uniq
        uniq_arr = []
        self.each {|el| uniq_arr << el if !uniq_arr.include?(el)}
        uniq_arr

        # OR
        # hash = {}
        # self.each {|el| hash[el] = true}
        # hash.keys
    end

    def my_transpose
        transposed_arr = Array.new(self.length) {[]}
        self.each do |sub_arr| 
            sub_arr.each_with_index do |el, i| 
                transposed_arr[i] << el
            end
        end
        transposed_arr
    end
end


