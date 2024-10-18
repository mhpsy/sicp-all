#lang scheme

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

;; 验证可行
;; (car (cons 1 2))
;; (car (lambda (m) (m 1 2)))
;; (lambda (car) (car 1 2))

;; (car 1 2)
;; (lambda (p q) p)
;; (lambda (1 2) 1)
;; 1

;; 所以是可行的





