#lang scheme

(require (only-in "../../lib/matrix-utils.rkt" dot-product matrix-*-vector matrix-*-matrix transpose))

(define m (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define n (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(matrix-*-vector m (list 1 2 3 4))
(matrix-*-matrix m n)
(matrix-*-matrix n m)

(displayln m)
(transpose m)






