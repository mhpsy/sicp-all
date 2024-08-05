#lang scheme

(define (square x)(* x x))
(define (even? n)
  (= (remainder n 2) 0))
(define (get-random n)
  (+ 1 (random (- n 1))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else (remainder (* base (expmod base (- exp 1) m))
                         m))))

(define (check-ok x n)
  (cond ((= x 1) true)
        ((= x (- n 1))true )
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (check-ok (expmod a (- n 1) n) n))
  (try-it (get-random n)))

; times 是计算的次数 防止误判
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (prime? n)
  (fast-prime? n 100))

(prime? 1105)
(prime? 119)
(prime? 7)
(prime? 199)



