class Stack
  attr_reader :tower

  def initialize(tower)
    @tower = tower
  end

  def peek
    @tower.last
  end

  def push(el)
    @tower << el
  end

  def pop
    @tower.delete_at(-1)
  end
end

