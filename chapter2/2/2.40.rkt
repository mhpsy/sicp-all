#lang scheme
(require (only-in "../../lib/accumulate.rkt" accumulate enumerate-interval flatmap))

(define n 10)

(define use-list (accumulate
                  append
                  '()
                  (map
                   (lambda (x)
                     (map (lambda (y) (list x y))
                          (enumerate-interval 1 (- x 1))))
                   (enumerate-interval 1 n))))



