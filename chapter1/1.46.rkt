#lang scheme

; 只接受两个过程 所以返回的函数需要接受初始值 enough 肯定是是初始值跟guess都要的
(define (interative-improve enough? next)
  (define (fn guess x)
    (if (enough? guess x)
        guess
        (fn (next guess x) x) ))
  ;返回值就是这个fn
  fn)


(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) 0.001))

(define (next-guess guess x)
  (/ (+ (/ x guess) guess) 2))

(define (sqrt x)
  ((interative-improve good-enough? next-guess) 1.0 x))

(sqrt 4)
(sqrt 9)

