

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