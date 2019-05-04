
// class TreeNode {
//   constructor(val) {
//     this.val = val;
//     this.left = null;
//     this.right = null;
//   }
// }

// let a = new TreeNode('a');
// let b = new TreeNode('b');
// let c = new TreeNode('c');
// let d = new TreeNode('d');
// let e = new TreeNode('e');
// let f = new TreeNode('f');

// a.left = b;
// a.right = c;
// b.left = d;
// b.right = e;
// c.right = f;

// // console.log(a);



// // inorder traversal

// function inOrder(root) {
//   if (!root) return;

//   inOrder(root.left);
//   console.log(root.val);
//   inOrder(root.right);
// }

// // inOrder(a);




// // pre_order traversal

// function preOrder(root) {
//   if (!root) return;

//   console.log(root.val);
//   preOrder(root.left);
//   preOrder(root.right);
// }

// // preOrder(a);


// function postOrder(root) {
//   if (!root) return;

//   postOrder(root.left);
//   postOrder(root.right);
//   console.log(root.val);
// }

// postOrder(a)





// // DFS - Binary Tree

// function depthFirst(root) {
//   if (!root) return [];

//   let stack = [root];

//   while (stack.length) {
//     let node = stack.pop();

//     console.log(node.val);
//     if (node.right) stack.push(node.right);
//     if (node.left) stack.push(node.left);
//   }
// }

// function depthFirstRecursive(root) {
//   if (!root) return null;

//   console.log(root.val);
//   depthFirstRecursive(root.left);
//   depthFirstRecursive(root.right);
// }


// function breadthFirst(root) {
//   if (!root) return;

//   let queue = [root];

//   while (queue.length) {
//     let node = queue.shift();

//     console.log(node.val);
//     if (node.left) queue.push(node.left);
//     if (node.right) queue.push(node.right);
//   }

// }








// BFS - Binary Tree



// class TreeNode {
//   constructor(val) {
//     this.val = val;
//     this.left = null;
//     this.right = null;
//   }
// }

// a = new TreeNode('a');
// b = new TreeNode('b');
// c = new TreeNode('c');
// d = new TreeNode('d');
// e = new TreeNode('e');
// f = new TreeNode('f');
// g = new TreeNode('g');

// a.left = b;
// a.right = c;
// b.left = d;
// b.right = e;
// c.left = f;
// c.right = g;

// console.log(a);


// function depthFirst(root) {
//   if (!root) return null;

//   let stack = [root];

//   while (stack.length) {
//     let node = stack.pop();

//     console.log(node.val);

//     if (node.right) stack.push(node.right);
//     if (node.left) stack.push(node.left);
//   }
// }

// // depthFirst(a);


// // function breadthFirst(root) {
// //   if (!root) return null;

// //   let queue = [root];

// //   while (queue.length) {
// //     let node = queue.shift();

// //     console.log(node.val);
// //     if (node.left) queue.push(node.left);
// //     if (node.right) queue.push(node.right);
// //   }
// // }


// function depthFirstRecur(root) {
// if (!root) return null;

//   console.log(root.val);
//   depthFirstRecur(root.left);
//   depthFirstRecur(root.right);
// }
// depthFirstRecur(a);






// BST (naive implementation)

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

  insert(val, root=this.root) {
    if (!root) {
      let newNode = new TreeNode(val);
      this.root = newNode;
      return;
    }

    if (val < root.val) {
      if (!root.left) {
        let newNode = new TreeNode(val);
        root.left = newNode;
      } else {
        this.insert(val, root.left);
      }
    } else if (val >= root.val) {
      if (!root.right) {
        let newNode = new TreeNode(val);
        root.right = newNode;
      } else {
        this.insert(val, root.right);
      }
    }
  }

  inOrderPrint(root=this.root) {
    if (!root) return;

    this.inOrderPrint(root.left);
    console.log(root.val);
    this.inOrderPrint(root.right);
  }
}

let bst = new BST();
bst.insert(10);
bst.insert(5);
bst.insert(15);
bst.insert(2);
bst.insert(7);
bst.insert(13);
bst.insert(20);

console.log(bst);

bst.inOrderPrint();