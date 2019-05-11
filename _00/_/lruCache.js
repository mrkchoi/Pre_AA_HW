

class ListNode {
  constructor(val, prev=null, next=null) {
    this.val = val;
    this.prev = null;
    this.next = null;
  }

  delete() {
    if (this.prev) this.prev.next = this.next;
    if (this.next) this.next.prev = this.prev;
  }
}

class List {
  constructor() {
    this.head = null;
    this.tail = null;
  }

  push(val) {
    if (!this.head && !this.tail) {
      this.head = this.tail = new ListNode(val);
    } else {
      this.tail = new ListNode(val, this.tail, null);
      this.tail.prev.next = this.tail;
    }

    return this.tail;
  }

  pop() {
    if (!this.tail) {
      return null;
    } else {
      let tail = this.tail;
      this.tail = this.tail.prev;
      tail.delete();
      return tail.val;
    }
  }

  unshift(val) {
    if (!this.head) {
      let newNode = new ListNode(val);
      this.head = newNode;
      this.tail = this.head;
    } else {
      this.head = new ListNode(val, null, this.head);
      this.head.next.prev = this.head;
    }

    return this.head;
  }

  shift() {
    
  }
}