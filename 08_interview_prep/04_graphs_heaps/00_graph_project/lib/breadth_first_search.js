function breadthFirstSearch(startingNode, targetVal) {
    if (!startingNode) return null;
    if (startingNode.val === targetVal) return startingNode;

    let queue = [startingNode];
    let visited = new Set();

    while (queue.length) {
        let node = queue.shift();

        if (visited.has(node)) continue;

        if (node.val === targetVal) return node;
        visited.add(node);

        queue.push(...node.neighbors);
    }
    return null;
}

module.exports = {
    breadthFirstSearch
};