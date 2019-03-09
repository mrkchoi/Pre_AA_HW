require 'byebug'

class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    @parent.children.reject! {|child| child == self} if !@parent.nil?
    @parent = node
    node.children << self if !@parent.nil?
  end

  def add_child(child_node)
    child_node.parent = self
    @children << child_node if !@children.include?(child_node)
  end

  def remove_child(child_node)
    raise "Node is not a child of current node!" if !@children.include?(child_node)

    @children.reject {|child| child_node == child}
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value

    children.each do |child|
      current = child.dfs(target_value)
      return current if current
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      dequeued_el = queue.shift
      if dequeued_el.value == target_value
        return dequeued_el
      else
        dequeued_el.children.each {|child| queue << child}
      end
    end
    nil
  end
end