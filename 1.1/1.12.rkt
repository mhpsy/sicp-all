#lang scheme
(define (run n fn)
(if (> n 0)
    (run (fn (- n 1)) fn)
     0))

(define (log x)
  (display x)
  (newline)x)

(run 10 log)