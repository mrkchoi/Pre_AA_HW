// function maxValue(node, visited=new Set()) {
//     max = null;
//     if (!node) return max;

//     let queue = [node];

//     while (queue.length) {
//         let node = queue.shift();

//         if (visited.has(node)) continue;

//         if (max === null || node.val > max) {
//             max = node.val;
//         }

//         visited.add(node);

//         node.neighbors.forEach(neighbor => {
//             queue.push(neighbor);
//         });
//     }

//     return max;
// }



function maxValue(node, visited = new Set()) {
    if (visited.has(node)) return -Infinity;

    visited.add(node);
    
    let neighborMaxes = node.neighbors.map(neighbor => {
        return maxValue(neighbor, visited);
    });

    return Math.max(node.val, ...neighborMaxes);
}


module.exports = {
    maxValue
};