import { allSettled } from "q";


// Leetcode 160: Intersection of Two Linked Lists
var getIntersectionNode = function (headA, headB) {
  if (!headA || !headB) {
    return null;
  } else if ((headA.next === null || headB.next === null) && headA != headB) {
    return null;
  }

  let listALength = getLinkedListLength(headA);
  let listBLength = getLinkedListLength(headB);

  let diff = Math.abs(listALength - listBLength);
  let long = listALength >= listBLength ? headA : headB;
  let short = listALength >= listBLength ? headB : headA;

  while (long && short) {
    if (diff > 0) {
      long = long.next;
      diff -= 1;
      continue;
    }

    if (long === short) {
      return long;
    }

    long = long.next;
    short = short.next;
  }

  return null;
};

function getLinkedListLength(head) {
  if (head.next === null) {
    return 1;
  } else {
    return getLinkedListLength(head.next) + 1;
  }
}






// Leetcode 141: Linked List Cycle
var hasCycle = function (head) {
  if (head === null || head.next === null) {
    return false;
  }

  let walker = head;
  let runner = head;

  while (walker.next != null && runner.next != null && runner.next.next != null) {
    walker = walker.next;
    runner = runner.next.next;

    if (walker === runner) {
      return true;
    }
  }
  return false;
};








// Leetcode 234: Palindrome Linked List
var isPalindrome = function (head) {
  // Edge case check
  if (head === null || head.next === null) {
    return true;
  }
  
  // set walker & runner to find midpoint
  let walker = head;
  let runner = head;

  while (runner && runner.next) {
    runner = runner.next.next;
    walker = walker.next;
  }

  // Reverse starting from midpoint
  let node = null;
  let next;
  
  // Iterate through first half and reversed second half
  while (walker) {
    next = walker.next;
    walker.next = node;
    node = walker;
    walker = next;
  }

  // Check that every node is a match
  while (node && head) {
    if (node.val != head.val) {
      return false;
    }
    node = node.next;
    head = head.next;
  }

  return true;
}





// Leetcode 237: Delete Node in a Linked List
var deleteNode = function (node) {
  let next = node.next;
  node.val = next.val;
  node.next = next.next;
};




// Leetcode 2: Add Two Numbers
// Passes 1560 / 1563 test cases
var addTwoNumbers = function (l1, l2) {
  if (l1 === null || l2 === null) {
    return null;
  }

  let list1Values = [];
  let list2Values = [];

  while (l1 != null) {
    list1Values.unshift(l1.val);
    l1 = l1.next;
  }

  while (l2 != null) {
    list2Values.unshift(l2.val);
    l2 = l2.next;
  }

  list1Values = parseInt(list1Values.join(''));
  list2Values = parseInt(list2Values.join(''));

  let totalValue = (list1Values + list2Values)
    .toString()
    .split('')
    .reverse()
    .map(el => {
      return parseInt(el);
    });


    let newHead = new ListNode(totalValue.shift());
    let node = newHead;

    while (totalValue.length > 0) {
      node.next = new ListNode(totalValue.shift());
      node = node.next;
    }

    return newHead;
};


var addTwoNumbers = function (l1, l2) {
  let res = new ListNode(null);
  let item = res;
  let remainder = 0;
  let prev;

  while(l1 || l2) {
    let left = l1 ? l1.val : 0;
    let right = l2 ? l2.val : 0;
    
    item.val = left + right + remainder;

    if (remainder > 0) {
      remainder = 0;
    }

    if (item.val >= 10) {
      item.val -= 10;
      remainder = 1;
    }

    item.next = new Listnode(null);
    prev = item;
    item = item.next;
    l1 = l1 ? l1.next : null;
    l2 = l2 ? l2.next : null;
  }

  if (remainder) {
    prev.next.val = remainder;
  } else {
    prev.next = null;
  }
  return res;
}


// (831).toString().split('').reverse().map(el => parseInt(el));




// Leetcode 203: Remove Linked List Elements
var removeElements = function (head, val) {
  if (head === null) {
    return null;
  }

  let prev = head;
  let cur = head.next;

  while (cur) {
    if (cur.val === val) {
      cur = cur.next;
      prev.next = cur;
    } else {
      prev = cur;
      cur = cur.next;
    }
  }
  if (head.val === val) {
    return head.next;
  }

  return head;
}










/**
 * Initialize your data structure here.
 */

var MyLinkedList = function () {
  this.head = null;
  this.length = 0;
}

// class Node {
//   constructor(val) {
//     this.val = val;
//     this.next = null;
//   }
// }

/**
 * Get the value of the index-th node in the linked list. If the index is invalid, return -1. 
 * @param {number} index
 * @return {number}
 */
MyLinkedList.prototype.get = function (index) {
  if (index >= this.length) {
    return -1;
  } else {
    let node = this.head;
    let curIdx = 0;
    while (curIdx < index) {
      node = node.next;
      curIdx += 1;
    }
    return node.val;
  }
};

/**
 * Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. 
 * @param {number} val
 * @return {void}
 */
MyLinkedList.prototype.addAtHead = function (val) {
  let newNode = new Node(val);
  newNode.next = this.head;
  this.head = newNode;
  this.length += 1;
};

/**
 * Append a node of value val to the last element of the linked list. 
 * @param {number} val
 * @return {void}
 */
MyLinkedList.prototype.addAtTail = function (val) {
  let newNode = new Node(val);

  if (this.head === null) {
    this.addAtHead(val);
    return;
  } else {
    let curNode = this.head;

    while (curNode.next != null) {
      curNode = curNode.next;
    }
    newNode.next = null;
    curNode.next = newNode;
    this.length += 1;
  }
};

/**
 * Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. 
 * @param {number} index 
 * @param {number} val
 * @return {void}
 */
MyLinkedList.prototype.addAtIndex = function (index, val) {
  let newNode = new Node(val);

  if (index < 0 || index > this.length) {
    return;
  } else if (index === 0) {
    this.addAtHead(val);
    return;
  } else if (index === this.length) {
    this.addAtTail(val);
  } else {
    let curIdx = 0;
    let curNode = this.head;

    while (curIdx < index-1) {
      curnode = curNode.next;   
      curIdx += 1;
    }
    let prev = curNode;
    next = curNode ? curNode.next : null;
    newNode.next = next;
    prev.next = newNode;
    this.length += 1;
  }
};

/**
 * Delete the index-th node in the linked list, if the index is valid. 
 * @param {number} index
 * @return {void}
 */
MyLinkedList.prototype.deleteAtIndex = function (index) {
  if (index < 0 || index > this.length - 1) {
    return;
  } else {
    let curIdx = 0;
    let curNode = this.head;
    
    while (curIdx < index-1) {
      curNode = curNode.next;
      curIdx += 1;
    }

    let prev = curNode;
    next = curNode.next.next;
    prev.next = next;
    this.length -= 1;
  }
};

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * var obj = new MyLinkedList()
 * var param_1 = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index,val)
 * obj.deleteAtIndex(index)
 */






// Leetcode 876: Middle of the Linked List
var middleNode = function (head) {
  if (head === null) return null;

  let length = 1;
  let node = head;

  while (node.next != null) {
    node = node.next;
    length += 1;
  }

  let midIdx = Math.floor(length / 2);
  let finalIdx = 0;
  node = head;

  if (midIdx === 0) return head;

  while (finalIdx < midIdx) {
    node = node.next;
    finalIdx += 1;
  }

  return node;
};



// CTCI 2.1: Remove Dups
// Write code to remove duplicates from an unsorted linked list.
// Follow up: How would you solve this problem if a temporary buffer is not allowed?

class LinkedList {
  constructor() {
    this.head = null;
    this.length = 0;
  }

  print() {
    let output = '';
    let node = this.head;

    while (node.next != null) {
      output += `${node.val} -> `;
      node = node.next;
    }

    return output;
  }
}

// class Node {
//   constructor(val) {
//     this.val = val;
//     this.next = null;
//   }
// }


function removeDups(head) {
  if (head === null) {
    return null;
  } else if (head.next === null) {
    return head;
  }

  let hash = {};
  let prev = null;
  let node = head;

  while (node != null) {
    if (!hash.node) {
      hash.node = true;
      prev = node;
      node = node.next;
    } else {
      prev.next = node.next;
      node = node.next;
    }
  }

  return head;
}



// let list = new LinkedList();
// list.head = new Node(3);
// list.head.next = new Node(2);
// list.head.next.next = new Node(3);
// list.head.next.next.next = new Node(4);
// list.head.next.next.next.next = new Node(2);
// list.head.next.next.next.next.next = new Node(5);








// Stack implementation w/o arrays

class Node {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

class Stack {
  constructor() {
    this.top = null;
    this.bottom = null;
    this.length = null;
  }

  push(val) {
    const newNode = new Node(val);

    if (!this.top) {
      this.top = newNode;
      this.bottom = newNode;
    } else {
      const temp = this.top;
      this.top = newNode;
      this.top.next = temp;
    }
    this.length += 1;
    return this.top;
  }

  pop() {
    if (!this.top) {
      return null;
    }

    const temp = this.top;
    if (this.top === this.bottom) {
      this.bottom = null;
    }

    this.top = this.top.next;
    this.length -= 1;
    return temp.val;

  }

  size() {
    return this.length;
  }
}


class Queue {
  constructor() {
    this.front = null;
    this.back = null;
    this.length = 0;
  }

  enqueue(val) {
    let newNode = new Node(val);

    if (!this.front) {
      this.front = newNode;
      this.back = newNode;
      
    } else {
      this.back.next = newNode;
      this.back = newNode;
    }
    this.length += 1;
    return;
  }

  dequeue() {
    if (!this.front) {
      return null;
    }

    if (this.front === this.back) {
      this.back = null;
    }

    const temp = this.front;

    this.front = this.front.next;
    this.length -= 1;
    return temp.val;
  }

  size() {

  }
}
