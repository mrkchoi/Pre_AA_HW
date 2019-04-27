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