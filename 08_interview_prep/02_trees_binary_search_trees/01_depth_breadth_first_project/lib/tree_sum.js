

function treeSum(root) {
    if (!root) return 0;
    return treeSum(root.left) + root.val + treeSum(root.right);
}







// function treeSum(root) {
//     let sum = 0;
//     if (!root) return sum;

//     let queue = [root];

//     while (queue.length) {
//         let node = queue.shift();

//         sum += node.val;

//         if (node.left) queue.push(node.left);
//         if (node.right) queue.push(node.right);
//     }

//     return sum;    
// }


module.exports = {
    treeSum
};

