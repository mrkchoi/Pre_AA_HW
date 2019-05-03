# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.sum / self.count.to_f
  end

  def median
    return nil if self.empty?
    sorted = self.sort
    if self.count.odd?
      mid = (self.count / 2)
      return sorted[mid]
    else
      mid1 = (self.count / 2) - 1
      mid2 = (self.count / 2)
      return (sorted[mid1] + sorted[mid2]) / 2.to_f
    end
  end

  def counts
    hash = Hash.new(0)
    self.each {|el| hash[el] += 1}
    hash
  end

  def my_count(val)
    count = 0
    self.each do |el|
      count += 1 if el == val
    end
    count
  end
  
  def my_index(val)
    self.each_with_index do |el, i|
      return i if el == val
    end
    nil
  end

  def my_uniq
    hash = Hash.new
    output = []
    self.each do |el|
      if hash[el]
        next
      else
        output << el
        hash[el] = true
      end
    end
    output
  end

  def my_transpose
    output = Array.new(self.length) {Array.new(self.length)}
    i = 0
    while i < self.length
      j = 0
      while j < self.length
        output[j][i], output[i][j] = self[i][j], self[j][i]
        j += 1
      end
      i += 1
    end
    output
  end
  
end
