#lang scheme

(define (reverse items)
  (if (null? items)
      items
      ;; 把第一个放后面 把剩下的放前面 递归
      (append (reverse (cdr items)) (list (car items)))))

(define test (list 1 2 3 4 5 6 7 8 9 10))

(reverse test)
