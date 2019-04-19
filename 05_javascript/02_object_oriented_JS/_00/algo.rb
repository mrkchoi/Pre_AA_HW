# Complete the insertNodeAtPosition function below.

#
# For your reference:
#
# SinglyLinkedListNode
#     int data
#     SinglyLinkedListNode next
#
#

# def insertNodeAtPosition(llist, data, position)
#   new_node = SinglyLinkedListNode.new(data)
  
#   if position == 0
#     new_node.next = llist
#     return new_node
#   end

#   count = 0
#   current_node = llist

#   while count < position - 1
#     current_node = current_node.next
#     count += 1
#   end

#   new_node.next = current_node.next
#   current_node.next = new_node

#   llist
# end

















def sortedInsert(head, data)
  new_node = DoublyLinkedListNode.new(data)
  return new_node if head.nil?

  current_node = head
  
  if current_node.data > new_node.data
    new_node.next = current_node
    current_node.prev = new_node
    return new_node
  end

  while current_node.next && current_node.next.data < data
    head = head.next
  end

  new_node.next = current_node.next
  new_node.prev = current_node
  current_node.next = new_node
  new_node.next.prev = new_node if new_node.next

  head
end