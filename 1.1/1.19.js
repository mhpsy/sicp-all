function fib(n) {
    return fibIter(1, 0, 0, 1, n);
}

function fibIter(a, b, p, q, count) {
    debugger
    if (count === 0) {
        return b;
    } else if (count % 2 === 0) {
        return fibIter(a,
                       b,
                       p * p + q * q,
                       2 * p * q + q * q,
                       count / 2);
    } else {
        return fibIter(b * q + a * q + a * p,
                       b * p + a * q,
                       p,
                       q,
                       count - 1);
    }
}

console.log(fib(5)); 
// console.log(fib(6));
// console.log(fib(7));