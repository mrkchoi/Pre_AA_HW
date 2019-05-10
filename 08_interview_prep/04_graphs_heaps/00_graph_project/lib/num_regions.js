

function numRegions(graph) {
    if (!graph) return 0;

    let count = 0;
    let visited = new Set();

    for (let node in graph) {
        if (depthFirst(node, graph, visited)) count += 1; 
    }

    return count;
}

function depthFirst(node, graph, visited) {
    if (!node) return;

    if (visited.has(node)) return false;
    visited.add(node);

    graph[node].forEach(neighbor => {
        depthFirst(neighbor, graph, visited);
    });

    return true;
}















































































// function numRegions(graph) {
//     if (!graph) return null;

//     let count = 0;
//     let visited = new Set();
    
//     for (let node in graph) {
//         if (depthFirst(node, graph, visited)) count += 1;
//     }
//     return count;
// }

// function depthFirst(node, graph, visited) {
//     if (!node) return;

//     if (visited.has(node)) return false;
//     visited.add(node);

//     graph[node].forEach(neighbor => depthFirst(neighbor, graph, visited));
//     return true;
// }

module.exports = {
    numRegions
};
