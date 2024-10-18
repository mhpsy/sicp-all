#lang scheme

(require (only-in "./accumulate.rkt" accumulate accumulate-n))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row)
           ; (displayln row)
           (matrix-*-vector cols row)) m)))

(define (transpose mat)
  (accumulate-n cons '() mat))

(provide dot-product matrix-*-vector matrix-*-matrix transpose)