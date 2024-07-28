#lang scheme

; 判断下一次迭代的差值
(define (good-enough? guess x)
    (< (abs (- guess (next-guess guess x))) 0.000001))

(define (next-guess guess x)
  (/ (+ (/ x guess) guess) 2))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (next-guess guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)
(sqrt 0.000009)



