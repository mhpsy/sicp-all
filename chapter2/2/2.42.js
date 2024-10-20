function accumulate(op, initial, sequence) {
    return sequence.reduce(op, initial);
}

function enumerateInterval(low, high) {
    return Array.from({ length: high - low + 1 }, (_, i) => low + i);
}

function flatmap(f, seq) {
    return seq.flatMap(f);
}

const emptyBoard = [];

function safe(k, position) {
    for (let i = 0; i < position.length; i++) {
        for (let j = i + 1; j < position.length; j++) {
            if (
                position[i] === position[j] ||
                Math.abs(position[i] - position[j]) === j - i
            ) {
                return false;
            }
        }
    }
    return true;
}

// function safe(k, position) {
//   return iterCheck(position[0], position.slice(1), 1);
// }

// function iterCheck(rowOfNewQueen, restOfQueens, i) {
//   if (restOfQueens.length === 0) {
//     return true;
//   }
//   const rowOfCurrentQueen = restOfQueens[0];
//   if (
//     rowOfNewQueen === rowOfCurrentQueen ||
//     rowOfNewQueen === rowOfCurrentQueen + i ||
//     rowOfNewQueen === rowOfCurrentQueen - i
//   ) {
//     return false;
//   }
//   return iterCheck(rowOfNewQueen, restOfQueens.slice(1), i + 1);
// }

function adjoinPosition(newRow, k, restOfQueens) {
    return [newRow, ...restOfQueens];
}

function queen(boardSize) {
    function queenCols(k) {
        if (k === 0) {
            return [emptyBoard];
        }
        return queenCols(k - 1)
            .flatMap(restOfQueens => {
                // restOfQueens 是前k-1列放置k-1皇后的一种方式
                // console.log(restOfQueens);
                return enumerateInterval(1, boardSize).map(newRow => {
                    // newRow 是第k行放置所考虑的行编号
                    // console.log(newRow)
                    return adjoinPosition(newRow, k, restOfQueens)
                })
            })
            // 每次只会处理没有问题的队列
            .filter(positions => safe(k, positions));
    }
    return queenCols(boardSize);
}

const result = queen(8);
result.forEach(pos => console.log(pos));
console.log(result.length);

// const res = safe(0, [5, 3, 1, 4, 8, 7, 2, 6]);
// console.log(res);
