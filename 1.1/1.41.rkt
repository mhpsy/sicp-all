#lang scheme

; (define (double f)
;   (lambda (x) (+ (f x) (f x))))

(define (inc x) (+ x 1))

(define (double f)
  (lambda (x) (f (f x))))

(((double (double double)) inc) 5)
; 没想明白  why 21

(((double(double (double double))) inc) 5)

(((double double)inc) 5)

