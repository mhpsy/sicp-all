#lang scheme

(define (square x)(* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder a b) 0))


(define (prime? n)
  (= n (smallest-divisor n)))

; (smallest-divisor 199)
; (smallest-divisor 1999)
; (smallest-divisor 19999)

; (prime? 199)
; (prime? 9)

; (divides? 18 18)
; (divides? 19 8)











(provide prime?)