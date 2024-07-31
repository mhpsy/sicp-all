#lang scheme

(define (times x y)
  (if(= y 1)x
     (+ x (times x (- y 1)))))

(define (double x)(times x 2))

(define (halve x)
  (cond ((even? x) (/ x 2))
        (else (/ (- x 1) 2))))

(define (even? n)(= (remainder n 2) 0))

(define (times-plus x y)
  (define (times-plus-iter x y temp)
    (cond ((= x 1) (+ temp y))
          ((even? x)(times-plus-iter (halve x) (double y) temp ))
          (else (times-plus-iter (halve x) (double y) (+ temp y)))))
  (times-plus-iter x y 0))

(times-plus 2 3)
(times-plus 2 4)
(times-plus 2 5)
(times-plus 2 6)

(times-plus 3 3)
(times-plus 3 4)
(times-plus 3 5)
(times-plus 3 6)





; (define (square n)(* n n))

; (define (fast-expt x n)
;   (define (fast-expt-iter x n temp)
;     (cond
;       ((= n 0) temp)
;       ((even? n)(fast-expt-iter (square x) (halve n) temp))
;       (else (fast-expt-iter x (- n 1) (times x temp)))
;       ))
;   (fast-expt-iter x n 1))