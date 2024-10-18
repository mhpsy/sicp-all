#lang scheme
(require (only-in "../../lib/accumulate.rkt" accumulate accumulate-n))

(define demo-list (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(accumulate-n + 0 demo-list)

