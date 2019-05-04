// View the full problem and run the test cases at:
//  https://leetcode.com/problems/balanced-binary-tree/

class TreeNode {
  constructor(val) {
    this.val = val;
    this.left = null;
    this.right = null;
  }
}


class BST {
  constructor() {
    this.root = null;
  }

  insert(val, root = this.root) {
    if (!root) {
      this.root = new TreeNode(val);
      return;
    }

    if (val < root.val) {
      if (!root.left) {
        root.left = new TreeNode(val);
      } else {
        this.insert(val, root.left);
      }
    } else {
      if (!root.right) {
        root.right = new TreeNode(val);
      } else {
        this.insert(val, root.right);
      }
    }
  }

  searchRecur(val, root = this.root) {
    if (!root) return false;

    if (val < root.val) {
      return this.searchRecur(val, root.left);
    } else if (val > root.val) {
      return this.searchRecur(val, root.right);
    } else {
      return true;
    }
  }

  searchIter(val, root = this.root) {
    if (!root) return false;

    let queue = [root];

    while (queue.length) {
      let node = queue.shift();

      if (val == node.val) return true;

      if (node.left) queue.push(node.left);
      if (node.right) queue.push(node.right);
    }
    return false;
  }
}

let bst = new BST();
bst.insert(1);
bst.insert(-10);
bst.insert(20);

console.log(bst);

function getHeight(root) {
  if (!root) return 0;
  return 1 + Math.max(getHeight(root.left), getHeight(root.right));
}

console.log(getHeight(bst.root));

function isBalanced(root) {
  if (!root) return true;

  let left_height = getHeight(root.left);
  let right_height = getHeight(root.right);

  if ((Math.abs(left_height - right_height) <= 1) && (isBalanced(root.left) && isBalanced(root.right))) {
    return true;
  }
  return false;
}

console.log(isBalanced(bst.root));





































function getHeight(root) {
  if (!root) return 0;
  return Math.max(getHeight(root.left), getHeight(root.right)) + 1;
}

function isBalanced(root) {
  if (!root) return true;

  let leftHeight = getHeight(root.left);
  let rightHeight = getHeight(root.right);

  if (Math.abs(leftHeight - rightHeight) <= 1 &&
      isBalanced(root.left) &&
      isBalanced(root.right)) {
    return true;
  }

  return false;
}



























