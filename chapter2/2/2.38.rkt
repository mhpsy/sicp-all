#lang scheme
(require (only-in "../../lib/accumulate.rkt" fold-left fold-right))

(fold-left (lambda (x y)
             ; (displayln x) (displayln y)
             (+ x y)) 0 (list 1 2 3 4 5))
(newline)
(fold-right (lambda (x y)
              ; (displayln x) (displayln y)
              (+ x y)) 0 (list 1 2 3 4 5))

(fold-right / 1 (list 1 2 3))
(fold-left / 1 (list 1 2 3))

(fold-right list '() (list 1 2 3))
(fold-left list '() (list 1 2 3))

;; 结果一致的前提是： 满足交换律？ 比如+ 和 * 是满足的

