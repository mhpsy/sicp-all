#lang scheme

(require (only-in "1.35.fixed-point.rkt" fixed-point))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
