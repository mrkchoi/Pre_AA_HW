

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
    if (!this.head && !this.tail) {
      this.head = this.tail = new ListNode(val);
    } else {
      this.tail = new ListNode(val, this.tail, null);
      if (this.tail.prev) this.tail.prev.next = this.tail;
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
    if (this.tail === node) {
      this.pop();
    } else if (this.head === node) {
      return;
    } else {
      node.delete();
    }

    node.next = node.prev = null;

    if (!this.head) {
      this.head = this.tail = node;
    } else {
      let head = this.head;
      this.head = node;
      this.head.next = head;
      head.prev = this.head;
    }

    return this.head;
  }

  moveToBack(node) {
    if (this.head === node) {
      this.shift();
    } else if (this.tail === node) {
      return;
    } else {
      node.delete();
    }

    node.next = node.prev = null;

    if (!this.head) {
      this.head = this.tail = node;
    } else {
      let tail = this.tail;
      this.tail = node;
      this.tail.prev = tail;
      tail.next = this.tail;
    }
  }
}


class LRUCacheItem {
  constructor(val=null, key=null) {
    this.val = val;
    this.key = key;
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
    return this.length;
  }
  
  isFull() {
    return this.length >= this.limit;
  }

  get(key) {
    if (!this.items[key]) return null;

    let item = this.items[key];
    this.promote(item);

    return item.val;
  }

  set(key, val) {
    let item;

    if (this.items[key]) {
      item = this.items[key];
      item.val = val;
      this.promote(item);
    } else {
      if (this.isFull()) this.prune();

      item = new LRUCacheItem(val, key);
      item.node = this.ordering.unshift(item);
      this.items[key] = item;
      this.length += 1;
      }

  }

  prune() {
    let oldest = this.ordering.pop();
    delete this.items[oldest.key];
    this.length = Math.max(0, this.length - 1);
  }

  promote(item) {
    this.ordering.moveToFront(item.node);
  }
}