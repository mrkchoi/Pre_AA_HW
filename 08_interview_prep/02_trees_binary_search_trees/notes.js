
class TreeNode {
  constructor(val) {
    this.val = val;
    this.left = null;
    this.right = null;
  }
}

let a = new TreeNode('a');
let b = new TreeNode('b');
let c = new TreeNode('c');
let d = new TreeNode('d');
let e = new TreeNode('e');
let f = new TreeNode('f');

a.left = b;
a.right = c;
b.left = d;
b.right = e;
c.right = f;

// console.log(a);



// inorder traversal

function inOrder(root) {
  if (!root) return;

  inOrder(root.left);
  console.log(root.val);
  inOrder(root.right);
}

// inOrder(a);




// pre_order traversal

function preOrder(root) {
  if (!root) return;

  console.log(root.val);
  preOrder(root.left);
  preOrder(root.right);
}

// preOrder(a);


function postOrder(root) {
  if (!root) return;

  postOrder(root.left);
  postOrder(root.right);
  console.log(root.val);
}

postOrder(a)