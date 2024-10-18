function square(x) {
    return x * x;
}

function squareList(items) {
    function iter(things, answer) {
        if (things.length === 0) {
            return answer;
        }
        return iter(things.slice(1), answer.concat(square(things[0])));
    }
    return iter(items, []);
}

console.log(squareList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]));
