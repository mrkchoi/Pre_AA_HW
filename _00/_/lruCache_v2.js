

class ListNode {
  constructor(val, prev=null, next=null) {
    this.val = val;
    this.prev = prev;
    this.next = next;
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
    if (!this.head) {
      this.head = this.tail = new ListNode(val);
    } else {
      this.tail = new ListNode(val, this.tail, null);
      this.tail.prev.next = this.tail;  
    }

    return this.tail;
  }

  pop() {
    if (!this.head) {
      return null;
    } else {
      let tail = this.tail;
      this.tail = this.tail.prev;
      this.tail.next = null;
      tail.delete();
      return tail.val;
    }
  }

  unshift(val) {
    if (!this.head) {
      this.head = this.tail = new ListNode(val);
    } else {
      this.head = new ListNode(val, null, this.head);
      this.head.next.prev = this.head;
    }
  }

  shift() {
    if (!this.head) {
      return null;
    } else {
      let head = this.head;
      this.head = this.head.next;
      this.head.prev = null;
      head.delete();
      return head.val;
    }
  }

  moveToFront(node) {
    if (!node) return null; 

    if (this.head === node) {
      return;
    } else if (this.tail === node) {
      this.pop();
    } else {
      node.delete();
    }

    node.prev = node.next = null;

    if (!this.head) {
      this.head = this.tail = node;
    } else {
      let head = this.head;
      this.head = node;
      this.head.next = head;
      this.head.next.prev = this.head;
    }
  }

  moveToEnd(node) {
    if (!node) return null; 
    
    if (this.tail === node) {
      return;
    } else if (this.head === node) {
      this.shift();
    } else {
      node.delete();
    }

    node.prev = node.next = null;

    if (!this.head) {
      this.head = this.tail = node;
    } else {
      let tail = this.tail;
      this.tail = node;
      this.tail.prev = tail;
      this.tail.prev.next = this.tail;
    }
  }
}


class LRUCacheItem {
  constructor(key, val) {
    this.key = key;
    this.val = val;
    this.node = null;
  }
}

class LRUCache {
  constructor(limit) {
    this.items = {};
    this.ordering = new List();
    this.length = 0;
    this.limit = limit;
  }

  size() {

  }

  isFull() {

  }

  get(key) {

  }

  set(key, val) {

  }

  prune() {

  }

  promote(item) {

  }
}