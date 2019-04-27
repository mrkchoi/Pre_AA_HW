

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