# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    max = [num_1, num_2].max
    min = [num_1, num_2].min

    while true
        return max if max % num_1 == 0 && max % num_2 == 0
        max += 1
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigrams = Hash.new(0)

    i = 0
    while i < str.length - 1
        bigrams[str[i..i+1]] += 1  
        i += 1
    end

    max_num = 0
    max = nil

    bigrams.each do |k,v|
        if v > max_num
            max_num = v
            max = k
        end
    end
    max
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        hash = Hash.new
        self.each {|k,v| hash[v] = k}
        hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        all_pairs = []

        i = 0
        while i < self.length - 1
            j = i + 1    
            while j < self.length
                all_pairs << self[i] + self[j]
                j += 1
            end
            i += 1
        end
        all_pairs.select {|el| el == num}.count
    end


    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    def bubble_sort(&prc)
        sorted = false

        until sorted
            sorted = true
            i = 0
            while i < self.length - 1
                if prc.nil?
                    if self[i] > self[i + 1]
                        self[i], self[i+1] = self[i+1], self[i]
                        sorted = false
                    end
                else
                    if prc.call(self[i], self[i+1]) == 1
                        self[i], self[i+1] = self[i+1], self[i]
                        sorted = false
                    end
                end
                i += 1
            end
        end
        self
    end
end
