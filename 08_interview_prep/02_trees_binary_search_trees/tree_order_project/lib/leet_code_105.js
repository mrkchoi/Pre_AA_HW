// View the full problem and run the test cases at:
//  https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/


// Given preorder and inorder traversal of a tree, construct the binary tree.

//   Note:
// You may assume that duplicates do not exist in the tree.

// For example, given

// preorder = [3, 9, 20, 15, 7]
// inorder = [9, 3, 15, 20, 7]
// Return the following binary tree:

//     3
//    / \
//   9  20
//     /  \
//    15   7


const { TreeNode } = require('./tree_node.js');


// function buildTree(preorder, inorder) {
//   if (!preorder.length && !inorder.length) return null;

//   let root = new TreeNode(preorder[0]);

//   let midIdx = inorder.indexOf(preorder[0]);
//   let leftInOrder = inorder.slice(0, midIdx);
//   let rightInOrder = inorder.slice(midIdx + 1);

//   let leftPreOrder = preorder.filter(val => leftInOrder.includes(val));
//   let rightPreOrder = preorder.filter(val => rightInOrder.includes(val));

//   root.left = buildTree(leftPreOrder, leftInOrder);
//   root.right = buildTree(rightPreOrder, rightInOrder);

//   return root;
// }




function buildTree(preorder, inorder) {
  function helper(p0, p1, i0, i1) {
    if (p0 > p1 || i0 > i1) return null;

    let value = preorder[p0],
      index = inorder.indexOf(value),
      lTree = index - i0,
      root = new TreeNode(value);

    root.left = helper(p0 + 1, p1 + lTree, i0, index - 1);
    root.right = helper(p0 + lTree + 1, p1, index + 1, i1);

    return root;
  }

  return helper(0, preorder.length - 1, 0, inorder.length - 1);
}




// var buildTree = function (preorder, inorder) {
//   if (!inorder.length) {
//     return null;
//   }

//   var root = new TreeNode(preorder.shift());
//   var inorderIndex = inorder.indexOf(root.val);

//   // divide the inorder list into left side
//   root.left = buildTree(preorder, inorder.slice(0, inorderIndex));
//   // divide the inorder list into right side
//   root.right = buildTree(preorder, inorder.slice(inorderIndex + 1));

//   return root;
// };



var buildTree = function (preorder, inorder) {
  if (!inorder.length) return null;

  let newNode = new TreeNode(preorder.shift());
  let inorderIdx = inorder.indexOf(newNode.val);

  newNode.left = buildTree(preorder, inorder.slice(0,inorderIdx));
  newNode.right = buildTree(preorder, inorder.slice(inorderIdx+1));

  return newNode;
};







var buildTree = function (preorder, inorder) {
  function helper(p0, p1, i0, i1) {
    if (p0 > p1 || i0 > i1) {
      return null;
    }

    let root = new TreeNode(preorder[p0]);
    let inorderIdx = inorder.indexOf(root.val);
    let leftNodes = inorderIdx - i0;

    root.left = helper(p0 + 1, p1 + leftNodes, i0, inorderIdx - 1);
    root.left = helper(p0 + leftNodes + 1, p1, inorderIdx + 1);

    return root;
  }

  return helper(0, preorder.length - 1, 0, inorder.length - 1);
};
