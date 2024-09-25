#lang scheme

(define (double x)(+ x x))

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

; 20 14
; 10 28
; 5  56
; 2  112
; 1  224

; 224+56=280