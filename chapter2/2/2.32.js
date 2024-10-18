// 下面的代码实际有问题
function cons(head, tail) {
    return { head, tail };
}

function car(pair) {
    return pair?.head;
}

function cdr(pair) {
    return pair?.tail;
}

function list(...elements) {
    let l = null;
    for (let i = elements.length - 1; i >= 0; i--) {
        l = cons(elements[i], l);
    }
    return l;
}

function listToArray(l) {
    const array = [];
    while (l !== null) {
        array.push(car(l));
        l = cdr(l);
    }
    return array;
}

function printList(l) {
    console.log(listToArray(l).join(" -> "));
}

function append(l1, l2) {
    if (l1 === null) return l2;
    return cons(car(l1), append(cdr(l1), l2));
}

function map(func, l) {
    if (l === null) return null;
    return cons(func(car(l)), map(func, cdr(l)));
}

function subsets(s) {
    if (s === null) {
        return list(list());
    } else {
        const rest = subsets(cdr(s));
        
        console.log("rest:");
        printList(listToArray(rest));
        
        console.log("s:");
        printList(listToArray(s));
        
        console.log("car s:");
        console.log(car(s));
        
        console.log("map:");
        const mapped = map(x => cons(car(s), x), rest);
        printList(listToArray(mapped));
        
        return append(rest, mapped);
    }
}

const l = list(1, 2, 3);
printList(subsets(l));
