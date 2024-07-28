#lang scheme

(define (cube-root-next-guess x guess)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (cube-root-iter x guess)
  (if (< (abs (- (cube-root-next-guess x guess) guess)) 0.0001)
      (cube-root-next-guess x guess)
      (cube-root-iter x
                      (cube-root-next-guess x guess))))

(define (cube-root x)  (cube-root-iter x 1.0))

(cube-root 27)
(cube-root 8)