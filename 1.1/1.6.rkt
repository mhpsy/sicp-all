#lang scheme

; 会进入死循环，因为 new-if 没有惰性求值，会直接把两个分支都求值

(define (new-if fn then-clause else-clause)
  (cond (fn then-clause)(else else-clause))
)

(define (good-enough? guess x)(< (abs (- (* guess guess) x)) 0.001))

(define (next-guess guess x)
(/ (+ (/ x guess) guess) 2)
)

(define (sort-iter-new guess x)
  (new-if (good-enough? guess x)
        guess
        (sort-iter-new (next-guess guess x) x)
        )
)

(define (sort-new x)(sort-iter-new 1.0 x))

(sort-new 4)

