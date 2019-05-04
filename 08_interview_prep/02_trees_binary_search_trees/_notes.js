
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






// // BST (naive implementation)

// class TreeNode {
//   constructor(val) {
//     this.val = val;
//     this.left = null;
//     this.right = null;
//   }
// }

// class BST {
//   constructor() {
//     this.root = null;
//   }

//   insert(val, root=this.root) {
//     if (!root) {
//       let newNode = new TreeNode(val);
//       this.root = newNode;
//       return;
//     }

//     if (val < root.val) {
//       if (!root.left) {
//         let newNode = new TreeNode(val);
//         root.left = newNode;
//       } else {
//         this.insert(val, root.left);
//       }
//     } else if (val >= root.val) {
//       if (!root.right) {
//         let newNode = new TreeNode(val);
//         root.right = newNode;
//       } else {
//         this.insert(val, root.right);
//       }
//     }
//   }

//   inOrderPrint(root=this.root) {
//     if (!root) return;

//     this.inOrderPrint(root.left);
//     console.log(root.val);
//     this.inOrderPrint(root.right);
//   }

//   search(val, root=this.root) {
//     if (!root) return false;

//     if (val < root.val) {
//       return this.search(val, root.left);
//     } else if (val > root.val) {
//       return this.search(val, root.right);
//     } else {
//       return true;
//     }
//   }
// }

// let bst = new BST();
// bst.insert(10);
// bst.insert(5);
// bst.insert(15);
// bst.insert(2);
// bst.insert(7);
// bst.insert(13);
// bst.insert(20);

// console.log(bst);

// bst.inOrderPrint();
// console.log(bst.search(20)); // => true
// console.log(bst.search(22)); // => false






// class TreeNode {
//   constructor(val) {
//     this.val = val;
//     this.left = null;
//     this.right = null;
//   }
// }

// class BST {
//   constructor() {
//     this.root = null;
//   }

//   insert(val, root=this.root) {
//     if (!root) {
//       this.root = new TreeNode(val);
//       return;
//     }

//     if (val < root.val) {
//       let newNode = new TreeNode(val);
//       if (!root.left) {
//         root.left = newNode;
//       } else {
//         this.insert(val, root.left);
//       }
//     } else {
//       let newNode = new TreeNode(val);
//       if (!root.right) {
//         root.right = newNode;
//       } else {
//         this.insert(val, root.right);
//       }
//     }
//   }

//   printTree(root=this.root) {
//     if (!root) return;

//     this.printTree(root.left);
//     console.log(root.val);
//     this.printTree(root.right);
//   }

//   binarySearch(val, root=this.root) {
//     if (!root) return false;

//     if (val < root.val) {
//       return this.binarySearch(val, root.left);
//     } else if (val > root.val) {
//       return this.binarySearch(val, root.right);
//     } else {
//       return true;
//     }
//   }
// }


// let bst = new BST();

// bst.insert(10);
// bst.insert(5);
// bst.insert(20);
// bst.insert(1);
// bst.insert(7);
// bst.insert(13);
// bst.insert(25);

// console.log(bst);

// bst.printTree();

// console.log(bst.binarySearch(8));







// var searchBST = function (root, val) {
//   if (!root) return null;

//   if (val < root.val) {
//     return searchBST(root.left, val);
//   } else if (val > root.val) {
//     return searchBST(root.right, val);
//   } else {
//     return root;
//   }
// };






var rangeSumBST = function (root, L, R) {
  if (!root) return 0;

  let sum = 0;
  let queue = [root];

  while (queue.length) {
    let node = queue.shift();

    if (node.val >= L && node.val <= R) {
      sum += node.val;
    }

    if (node.left) queue.push(node.left);
    if (node.right) queue.push(node.right);
  }

  return sum;
};
