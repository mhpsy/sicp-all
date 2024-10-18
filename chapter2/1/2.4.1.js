
// 如果这样来看的话 js 实现好像比 lisp 更加的好
// cons 实际上是一个序对
const cons = (x, y) => (m) => m(x, y);
const car = (z) => z((x, y) => x);
const cdr = (z) => z((x, y) => y);



const point = (x, y) => cons(x, y);

const point1 = point(1, 2);
const point2 = point(3, 4);

console.log(car(point1));
console.log(cdr(point1));

