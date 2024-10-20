#lang scheme

(require (only-in "../../lib/accumulate.rkt" accumulate enumerate-interval flatmap))

(define empty-board '())

(define (safe? position)
  (iter-check (car position)
              (cdr position)
              1))
; 把新加入的皇后和已有的皇后进行比较
(define (iter-check new-row-item rest-of-queens i)
  (if (null? rest-of-queens)
      #t
      (let ((row-of-current-queen (car rest-of-queens)))
        (if (or (= new-row-item row-of-current-queen)
                (= new-row-item (+ i row-of-current-queen))
                (= new-row-item (- row-of-current-queen i)))
            #f
            (iter-check new-row-item
                        (cdr rest-of-queens)
                        (+ i 1))))))

(define (adjoin-position new-row rest-of-queens)
  ; (append (list new-row) rest-of-queens)
  (cons new-row rest-of-queens)
  )

(define (queen board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         ; 这里的safe去掉了k 因为实际上只需要每次判断一遍就好了
         (lambda (positions) (safe? positions))
         (flatmap
          ;; rest-of-queens 是前k-1列放置k-1皇后的一种方式
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   ;; new-row 是第k行放置所考虑的行编号 也去掉了k参数 没有用
                   (adjoin-position new-row rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define result (queen 8))

(displayln result)
(displayln (length result))
