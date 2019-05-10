// you may assume that the array will always have a null element at the 0-th index
function isMaxHeap(array, idx=1) {
    if (array[idx] === undefined) return true;

    let leftChildIdx = idx * 2;
    let rightChildIdx = idx * 2 + 1;
    let leftVal = array[leftChildIdx] === undefined ? -Infinity : array[leftChildIdx];
    let rightVal = array[rightChildIdx] === undefined ? -Infinity : array[rightChildIdx];

    return array[idx] > leftVal && array[idx] > rightVal &&
        isMaxHeap(array, leftChildIdx) && 
        isMaxHeap(array, rightChildIdx);
}


module.exports = {
    isMaxHeap
};




// [null, 100, 50, 25, 30, 40, 20, 10]; // => true



class MaxHeap {
    constructor() {
        this.array = [null];
    }

    getParent(idx) {
        return Math.floor(idx / 2);
    }

    getLeftChild(idx) {
        return idx * 2;
    }

    getRightChild(idx) {
        return idx * 2 + 1;
    }

    insert(val) {
        this.array.push(val);
        this.siftUp(this.array.length - 1);
    }

    siftUp(idx) {
        if (idx === 1) return;

        let parentIdx = this.getParent(idx);
        if (this.array[idx] < this.array[parentIdx]) return;

        [this.array[idx], this.array[parentIdx]] = [this.array[parentIdx], this.array[idx]];

        this.siftUp(parentIdx);
    }

    deleteMax() {
        if (this.array.length === 2) return this.array.pop();
        if (this.array.length === 1) return null;

        let max = this.array[1];
        this.array[1] = this.array.pop();

        this.siftDown(1);

        return max;
    }

    siftDown(idx) {
        let arr = this.array;
        let leftChildIdx = this.getLeftChild(idx);
        let rightChildIdx = this.getRightChild(idx);
        let leftVal = arr[leftChildIdx];
        let rightVal = arr[rightChildIdx];

        if (leftVal === undefined) leftVal = -Infinity;
        if (rightVal === undefined) rightVal = -Infinity;

        if (arr[idx] > leftVal && arr[idx] > rightVal) return;

        let swapIdx;

        if (leftVal < rightVal) {
            swapIdx = rightChildIdx;
        } else {
            swapIdx = leftChildIdx;
        }

        [arr[idx], arr[swapIdx]] = [arr[swapIdx], arr[idx]];

        this.siftDown(swapIdx);
    }
}


var findKthLargest = function (nums, k) {
    let heap = new MaxHeap();
    nums.forEach(num => {
        heap.insert(num);
    });

    let kthLargest;
    for (let i = 0; i < k; i++) {
        kthLargest = heap.deleteMax();
    }

    return kthLargest;
};



console.log(findKthLargest([3,2,1,5,6,4], 2)); // => 5
console.log(findKthLargest([3,2,3,1,2,4,5,5,6], 4)); // => 4

