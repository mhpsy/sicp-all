const n = 6
const arr = [...Array(n).keys()].map(x => x + 1)
console.log(arr)

function enumerateInterval(n) {
    return [...Array(n).keys()].map(x => x + 1)
}

console.log(enumerateInterval(n))

const arr2 = enumerateInterval(n).flatMap(x => {
    return enumerateInterval(x - 1).map(y => [x, y])
})

console.log(arr2)

function permutations(s) {
    if (s.length === 0) {
        return [[]];
    }
    return s.flatMap(x =>
        permutations(remove(x, s)).map(p => [x, ...p])
    );
}

function remove(item, sequence) {
    return sequence.filter(x => x !== item);
}

console.log(permutations([1, 2, 3, 4]));

const test = [[]].flatMap(x => x)
console.log(test)