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

  shift() {
    if (!this.head) return null;

    let head = this.head;
    this.head = this.head.next;
    this.head.prev = null;
    head.delete();

    return head.val;
  }

  unshift(val) {
    if (!this.head) {
      this.head = this.tail = new ListNode(val);
    } else {
      let newNode = new ListNode(val, null, this.head);
      this.head = newNode;
      this.head.next.prev = this.head;
    }
  }

  pop() {
    if (!this.tail) return null;

    let tail = this.tail;
    this.tail = this.tail.prev;
    this.tail.next = null;
    tail.delete();

    return tail.val;
  }

  push(val) {
    if (!this.tail) {
      this.head = this.tail = new ListNode(val);
    } else {
      let newNode = new ListNode(val, this.tail, null);
      this.tail = newNode;
      this.tail.prev.next = this.tail;
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

    if (!this.tail) {
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

  get(key) {
    if (!this.items[key]) {
      return null;
    } else {
      let item = this.items[key];
      this.promote(item);
      return item.val;
    }
  }

  set(key, val) {
    let item;

    if (!this.items[key]) {
      if (this.isFull()) this.prune();

      item = new LRUCacheItem(key, val);
      item.node = this.ordering.unshift(item);
      this.items[key] = item;
      this.length += 1;
    } else {
      item = this.items[key];
      item.val = val;
      this.promote(item);
    }

    return item.val;
  }

  size() {
    return this.length;
  }

  isFull() {
    return this.length >= this.limit;
  }

  promote(item) {
    this.ordering.moveToFront(item.node);
  }

  prune() {
    let oldest = this.ordering.pop();
    delete this.items[oldest.key];
    this.length = Math.max(0, this.length -1);
  }
}


let c = new LRUCache(4);
c.set(1, 'a');
c.set(2, 'b');
c.set(3, 'c');
c.set(4, 'd');
c.set(5, 'e');