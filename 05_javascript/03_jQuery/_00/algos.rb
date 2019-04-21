

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
