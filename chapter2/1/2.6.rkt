#lang scheme

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (add-1 zero))

(define (church-to-int church-num)
  ((church-num (lambda (n) (+ n 1))) 0))

(church-to-int zero)



