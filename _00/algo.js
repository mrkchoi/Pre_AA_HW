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