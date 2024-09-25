#lang scheme

(define (times x y)
  (if(= y 1)x
     (+ x (times x (- y 1)))))

(define (double x)(times x 2))

(define (halve x)
  (cond ((even? x) (/ x 2))
        (else (/ (- x 1) 2))))

(define (even? n)(= (remainder n 2) 0))

(define (square n)(* n n))

(define (fast-expt x n)
  (define (fast-expt-iter x n temp)
    (cond
      ((= n 0) temp)
      ((even? n)(fast-expt-iter (square x) (halve n) temp))
      (else (fast-expt-iter x (- n 1) (times x temp)))
      ))
  (fast-expt-iter x n 1))


(fast-expt 2 3)
(fast-expt 2 4)
(fast-expt 3 3)
(fast-expt 3 4)


