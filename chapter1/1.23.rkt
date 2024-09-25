#lang scheme

(define (square x)(* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

; 2 3 5 7 
(define (next-value x)
  (cond ((= x 2) 3)
        (else (+ x 2))))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (next-value test-divisor)))))

(define (divides? a b)
  (= (remainder a b) 0))


(define (prime? n)
  (= n (smallest-divisor n)))

(prime? 199)
(prime? 9)
(prime? 1999)
(prime? 7)


; 因为上面算时间的有问题，没找到比较合适的方式算时间
; 所以这里就算时间了，直接分析

; 理论上是会快一半
; 但是因为原来的时间复杂度是O(根号n)
; 新的时间复杂度是O(根号n/2)
; 根号n/2和根号n 不是两倍的关系
