
function element(row, col) {
   if (col === 0 || col === row) {
      return 1
   } else {
      return element(row - 1, col - 1) + element(row - 1, col)
   }
}

function main(num) {
   for (let row = 0; row < num; row++) {
      let str = ''
      for (let col = 0; col <= row; col++) {
         str += element(row, col) + ' '
      }
      console.log(str)
   }
}

main(5);



