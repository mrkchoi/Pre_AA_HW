# require 'byebug'

class Array

  #   Remove dups
  # Array has a uniq method that removes duplicates from an array. It returns the unique elements in the order in which they first appeared:

  # [1, 2, 1, 3, 3].uniq # => [1, 2, 3]
  # Write your own version of this method called my_uniq; it should take in an Array and return a new array.

  def my_uniq
    hash = Hash.new(0)

    self.each do |el|
      hash[el] += 1
    end
    hash.keys
  end


  #   Two sum
  # Write a new Array#two_sum method that finds all pairs of positions where the elements at those positions sum to zero.

  # NB: ordering matters. We want each of the pairs to be sorted smaller index before bigger index. We want the array of pairs to be sorted "dictionary-wise":

  # [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
  # [0, 2] before [2, 1] (smaller first elements come first)
  # [0, 1] before [0, 2] (then smaller second elements come first)


  def two_sum
    output = []
    
    i = 0
    while i < self.length - 1
      j = i + 1
      while j < self.length
        output << [i, j] if self[i] + self[j] == 0
        j += 1  
      end
      i += 1
    end

    output.empty? ? nil : output
  end


  #   My Transpose
  # To represent a matrix, or two-dimensional grid of numbers, we can write an array containing arrays which represent rows:

  # rows = [
  #     [0, 1, 2],
  #     [3, 4, 5],
  #     [6, 7, 8]
  #   ]

  # row1 = rows[0]
  # row2 = rows[1]
  # row3 = rows[2]
  # We could equivalently have stored the matrix as an array of columns:

  # cols = [
  #     [0, 3, 6],
  #     [1, 4, 7],
  #     [2, 5, 8]
  #   ]
  # Write a method, my_transpose, which will convert between the row-oriented and column-oriented representations. You may assume square matrices for simplicity's sake. Usage will look like the following:

  # my_transpose([
  #     [0, 1, 2],
  #     [3, 4, 5],
  #     [6, 7, 8]
  #   ])
  #  # => [[0, 3, 6],
  #  #    [1, 4, 7],
  #  #    [2, 5, 8]]


  def my_transpose
    output = Array.new(self.length) {Array.new(self.length)}

    self.each_with_index do |row, row_i|
      row.each_with_index do |col, col_i|
        output[col_i][row_i] = self[row_i][col_i]
      end
    end
    output
  end



  # Stock Picker
  # Write a method that takes an array of stock prices (prices on days 0, 1, ...), and outputs the most profitable pair of days on which to first buy the stock and then sell the stock. Remember, you can't sell stock before you buy it!

  def stock_picker # => [1,2,0,4,3,8]
    max = nil
    max_pair = nil

    i = 0
    while i < self.length - 1
      j = i + 1
      while j < self.length
        current = self[j] - self[i]
        if max.nil? || current > max
          max = current
          max_pair = [i, j]
        end
        j += 1
      end
      i += 1
    end

    max_pair
  end

  

end

