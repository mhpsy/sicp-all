const zero = (f) => (x) => x;

const one = (f) => (x) => f(x);

const two = (f) => (x) => f(f(x));

const three = (f) => (x) => f(f(f(x)));

const add = (m) => (n) => (f) => (x) => m(f)(n(f)(x));

// 将number转换为church数
const numberToChurch = (number) => {
  return (f) => (x) => {
    for (let i = 0; i < number; i++) {
      x = f(x);
    }
    return x;
  };
};

/**
 * 将church数转换为number
 * church 的原理就是有一个函数这个函数调用的次数就是number的值
 * 所以转为数字就让函数为x+1 然后初始值为0 就好了
 */
const churchToNumber = (church) => church((x) => x + 1)(0);

console.log(churchToNumber(zero));
console.log(churchToNumber(one));
console.log(churchToNumber(two));
console.log(churchToNumber(three));

console.log(churchToNumber(add(one)(two)));

console.log(numberToChurch(10)((x) => x + 1)(0));
