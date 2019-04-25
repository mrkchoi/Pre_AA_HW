// ============================================================================
// Implementation Exercise: Singly Linked List
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Singly Linked List and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those 
// in the table provided in the Time and Space Complexity Analysis section
// of your Linked List reading!
//
// -----------
// Let's Code!
// -----------

// TODO: Implement a Linked List Node class here
class Node {
    constructor(val) {
        this.value = val;
        this.next = null;
    }
}

// TODO: Implement a Singly Linked List class here
class LinkedList {
    constructor() {
        this.head = null;
        this.tail = null;
        this.length = 0;
    }

    // TODO: Implement the addToTail method here
    addToTail(val) {
        let newNode = new Node(val);
        if (this.length === 0) {
            this.head = newNode;
            this.tail = newNode;
            this.length += 1;
        } else {
            this.tail.next = newNode;
            this.tail = newNode;
            this.length += 1;
        }
        return this;
    }

    // TODO: Implement the removeTail method here
    removeTail() {
        if (this.length === 0) {
            return undefined;
        } else if (this.length === 1) {
            this.head = null;
            this.tail = null;
            this.length = 0;
            return;
        }

        let tailDup = this.tail;
        let prevNode = null;
        let curNode = this.head;

        while (curNode.next != null) {
            prevNode = curNode;
            curNode = curNode.next;
        }
        
        this.tail = prevNode;
        this.tail.next = null;
        this.length -= 1;

        return tailDup;
    }

    // TODO: Implement the addToHead method here
    addToHead(val) {
        let newNode = new Node(val);
        newNode.next = this.head;
        this.head = newNode;

        if (this.length === 0) {
            this.tail = newNode;
        }

        this.length += 1;
        return this;
    }

    // TODO: Implement the removeHead method here
    removeHead() {
        if (this.length === 0) {
            return undefined;
        } else if (this.length === 1) {
            this.head = null;
            this.tail = null;
            this.length = 0;
            return;
        }

        let oldHead = this.head;
        let newHead = this.head.next;

        this.head = newHead;
        this.length -= 1;

        return oldHead;
    }

    // TODO: Implement the contains method here
    contains(target) {
        if (this.length === 0) {
            return undefined;
        } else if (this.length === 1) {
            return this.head.value === target;
        }

        let curNode = this.head;

        while (curNode != null) {
            if (curNode.value === target) {
                return true;
            }
            curNode = curNode.next;
        }
        return false;    
    }

    // TODO: Implement the get method here
    get(index) {
        let curIdx = 0;
        let curNode = this.head;

        if (this.length === 0 || index >= this.length) {
            return null;
        }

        while (curIdx < index) {
            curNode = curNode.next;
            curIdx += 1;
        }
        return curNode;
    }

    // TODO: Implement the set method here
    set(index, val) {
        if (this.length === 0 || index >= this.length) {
            return false;
        }

        let curIdx = 0;
        let curNode = this.head;

        while (curIdx < index) {
            curNode = curNode.next;
            curIdx += 1;
        }

        curNode.value = val;
        return true;
    }

    // TODO: Implement the insert method here
    insert(index, val) {
        let newNode = new Node(val);

        if (index > this.length) {
            return false;
        }

        let curIdx = 0;
        let curNode = this.head;
        let prevNode = null;

        while (curIdx < index) {
            prevNode = curNode;
            curNode = curNode.next;
            curIdx += 1;
        }

        prevNode.next = newNode;
        newNode.next = curNode;
        this.length += 1;
        return true;
    }

    // TODO: Implement the remove method here
    remove(index) {

    }

    // TODO: Implement the size method here
    size() {

    }
}

exports.Node = Node;
exports.LinkedList = LinkedList;
