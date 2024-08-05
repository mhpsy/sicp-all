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

(define (prime? n)
  (fast-prime? n 100))

(prime? 199)
(prime? 9)
(prime? 1999)

; 实际的执行时间肯定会有很多的问题，随机性太大
; 跟时间复杂度没什么关系

; 而且这个不是正确的费马小定理，119 会通过
