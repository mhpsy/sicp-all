#lang scheme

(define (square x)(* x x))
(define (even? n)
  (= (remainder n 2) 0))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else (remainder (* base (expmod base (- exp 1) m))
                         m))))

; times 是计算的次数 防止误判
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

; (fast-prime? 561 100)
(fast-prime? 1105 100)
; 1105 明显能被5整除

(require (only-in "1.21.rkt" prime?))

(prime? 1105)