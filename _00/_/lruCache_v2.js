

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

    if(!this.items[key]) {
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
  }

  prune() {
    let removed = this.ordering.pop();
    delete this.items[removed.key];
    this.length = Math.max(0, this.length - 1);
  }

  promote(item) {
    this.ordering.moveToFront(item.node);
  }
}

let c = new LRUCache(4);
c.set(1, 'a');
c.set(2, 'b');
c.set(3, 'c');
c.set(4, 'd');
c.set(5, 'e');