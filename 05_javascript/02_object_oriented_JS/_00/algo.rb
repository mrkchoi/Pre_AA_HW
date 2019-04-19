# Complete the insertNodeAtPosition function below.

#
# For your reference:
#
# SinglyLinkedListNode
#     int data
#     SinglyLinkedListNode next
#
#
def insertNodeAtPosition(llist, data, position)
  new_node = SinglyLinkedListNode.new(data)

  if position == 0
    new_node.next = llist
    return new_node
  end

  count = 0
  current_node = llist

  while count < position - 1
    current_node = current_node.next
    count += 1
  end

  new_node.next = current_node.next
  current_node.next = new_node

  llist
end
