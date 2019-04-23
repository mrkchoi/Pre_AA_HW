

def reverse(head)
  return nil if head.nil?

  current_node = head

  while !next_node.nil?
    prev_node = current_node.prev
    next_node = current_node.next

    if current_node == head
      current_node.next = nil
      current_node.prev = next_node
      current_node.prev.next = current_node
    else

    end
    current_node = prev_node

  end
end



def reverse(head, prev_node = nil)
  if head.nil?
    return prev_node
  end

  new_head = head.next
  head.next = prev_node
  return reverse(new_head, head)
end





def generate(num_rows)
    return nil if num_rows == 0
    return [[1]] if num_rows == 1
    return [[1, 1]] if num_rows == 1
    output = [[1], [1,1]]

    until output.length == num_rows
      last_row = output[-1]
      cur_row = [1]
      
      i = 0
      while i < last_row.length - 1
        pair_sum = last_row[i] + last_row[i + 1]
        cur_row << pair_sum        
        i += 1
      end
      cur_row << 1
      output << cur_row
    end
    
    output
end










def get_row(row_index)
    return [1] if row_index == 0
    return [1,1] if row_index == 1

    count = 1
    prev_row = [1,1]
    
    (row_index - 1).times do
      count += 1
      cur_row = [1]

      i = 0
      while i < prev_row.length - 1
        pair_sum = prev_row[i] + prev_row[i + 1]
        cur_row << pair_sum
        i += 1
      end

      cur_row << 1
      prev_row = cur_row
    end

    prev_row
end







def sorted_array_to_bst(nums)
  return nil if nums.nil? || nums.empty?

  mid = nums.length / 2
  n = TreeNode.new(nums[mid])
  
  n.left = sorted_array_to_bst(nums[0...mid])
  n.right = sorted_array_to_bst(nums[mid+1..-1])

  n
end











def sorted_array_to_bst(nums)
  return nil if nums.nil? || nums.empty?

  mid = nums / 2
  node = TreeNode.new(nums[mid])

  node.left = sorted_array_to_bst(arr[0...mid])
  node.right = sorted_array_to_bst(arr[mid+1..-1])
  
  node
end















# # class TreeNode
# #   attr_accessor :val, :left, :right
# #   def initialize(val)
# #     @val = val
# #     @left, @right = nil, nil
# #   end
# # end

# def height(root)
#   return 0 if root.nil?

#   [height(root.left), height(root.right)].max + 1
# end


# def is_balanced(root)
#   return true if root.nil?

#   left_height = height(root.left)
#   right_height = height(root.right)

#   if abs(left_height - right_height) <= 1 && is_balanced(root.left) && is_balanced(root.right)
#     return true
#   end

#   false
# end










def height(root)
  return 0 if root.nil?
  [height(root.left), height(root.right)].max + 1
end

def is_balanced(root)
  return true if root.nil?

  left_height = height(root.left)
  right_height = height(root.right)

  return true if (left_height - right_height).abs <= 1 && is_balanced(root.left) && is_balanced(root.right)

  false
end



















def min_depth(root)
  return 0 if root.nil?

  cur_node = [root, 1]
  queue = [cur_node]

  until queue.empty?
    node, height = queue.shift

    if node.left.nil? && node.right.nil?
      return height
    else
      queue << [node.left, height + 1] if node.left
      queue << [node.right, height + 1] if node.right
    end
  end
end







class MinStack
  def initialize()
    @mins, @stack = [], []
  end

  def push(el)
    @stack.push(el)
    @mins.push(el) if @mins.empty? || @mins.last >= el
  end

  def pop
    @mins.pop if @stack.pop == @mins.last
  end

  def top
    @stack.last
  end

  def get_min()
    @mins.last
  end
end









def has_path_sum(root, sum)
  return nil if root.nil?

  queue = [[root, 0]]

  until queue.empty?
    cur_node, node_sum = queue.pop()

    queue << [cur_node.left, node_sum + cur_node.val] if cur_node.left
    queue << [cur_node.right, node_sum + cur_node.val] if cur_node.right

    return true if cur_node.left.nil? && cur_node.right.nil? && node_sum + cur_node.val == sum
  end
  
  false
end











# def level_order_traversal(root)
#   values = []
#   return values if root.nil?
  
#   queue = [root]

#   until queue.empty?
#     level_vals = []
    
#     queue.length.times do
#       node = queue.shift()
#       level_vals << node.val

#       if node.left?
#         queue << node.left
#       end
#       if node.right?
#         queue << node.right
#       end
#     end

#     values << level_vals
#   end

#   values.reverse!
# end



















































def level_order_bottom(root)
  res = []
  return res if root.nil?

  queue = [root]
  until queue.empty?
    cur = []

    queue.length.times do 
      node = queue.shift()
      cur << node.val
      queue << node.left if node.left
      queue << node.right if node.right
    end
    res << cur
  end
  res.reverse!
end











































def level_order_bottom(root)
  res = []
  return [] if root.nil?

  queue = [root]

  until queue.empty?
    level = []
    queue.length.times do
      node = queue.shift()
      level << node.val

      queue << node.left if node.left
      queue << node.right if node.right
    end
    res << level
  end
  res.reverse!
end