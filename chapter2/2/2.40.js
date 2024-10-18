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
