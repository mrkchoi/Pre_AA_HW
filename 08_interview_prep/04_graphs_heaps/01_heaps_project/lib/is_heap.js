// you may assume that the array will always have a null element at the 0-th index
function isMaxHeap(array, idx=1) {
    if (array[idx] === undefined) return true;

    let leftChildIdx = idx * 2;
    let rightChildIdx = idx * 2 + 1;
    let leftVal = array[leftChildIdx];
    let rightVal = array[rightChildIdx];

    if (leftVal === undefined) leftVal = -Infinity;
    if (rightVal === undefined) rightVal = -Infinity;

    return array[idx] > leftVal && array[idx] > rightVal &&
        isMaxHeap(array, leftChildIdx) && 
        isMaxHeap(array, rightChildIdx);
}


module.exports = {
    isMaxHeap
};




// [null, 100, 50, 25, 30, 40, 20, 10]; // => true

