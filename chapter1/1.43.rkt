#lang scheme

(define (square x) (* x x))

(define (repeated f n)
  (if (= n 1)
      f
      (lambda (x) (f ((repeated f (- n 1)) x)))))


((repeated square 2) 5)
((repeated square 3) 2)
;2^2^2^2 = 2 ^ 8
