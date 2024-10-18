#lang scheme

(require (only-in "./matrix-utils.rkt" matrix-*-matrix transpose))

(define m (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define n (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(matrix-*-matrix m n)
(transpose m)

(cons 1 (cons 2 (cons 3 (cons 4 '()))))
(map * (list 1 2 3 4) (list 1 2 3 4))