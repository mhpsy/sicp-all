#lang scheme
(require (only-in "../../lib/accumulate.rkt" accumulate enumerate-interval flatmap))

;1. 先弄出全部的pair
;2. 然后过滤掉不等于n的
;3. 组合起来

(define n 10)
(define s 8)

(define (list-sum use-list)
;   (displayln (accumulate + 0 use-list))
  (accumulate + 0 use-list))

(define (make-list max-number)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k) (list i j k))
                             (enumerate-interval 1 (- j 1))))
                      (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 max-number)))

(define cal-list (make-list n))

(displayln cal-list)

(define res-list (filter (lambda (x) (= (list-sum x) s)) cal-list))

(displayln "--------------------------------")
(displayln res-list)