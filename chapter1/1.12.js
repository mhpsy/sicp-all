
function fill (num, value) {
   const arr = []
   for (let i = 0; i < num; i++) {
      arr.push(value)
   }
   return arr
}

function main(num) {

   const arr = []
   for (let i = 1; i <= num; i++) {
      arr.push([])
   }

   arr[0][0] = 1

   // row 开始从1 开始并且小于 num
   for (let row = 1; row < num; row++) {
      for (let col = 0; col <= row; col++) {
         if (col === 0 || col === row) {
            arr[row][col] = 1
         } else {
            arr[row][col] = arr[row - 1][col - 1] + arr[row - 1][col]
         }
      }
   }

   function print(arr) {
      // 找到最大的长度
      const maxLength = arr[arr.length - 1].length * 2 - 1

      for (let i = 0; i < arr.length; i++) {
         const row = arr[i]
         const rowLength = row.length
         const space = (maxLength - rowLength * 2) / 2
         let str = ''
         //开头的空格 结尾不需要
         str += fill(space, ' ').join('')
         for (let j = 0; j < rowLength; j++) {
            str += row[j] + ' '
         }
         console.log(str)
      }
   }
   print(arr)

}



main(5);



