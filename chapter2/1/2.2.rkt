#lang scheme

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (midpoint-segment segment)
  (cons (/ (+ (x-point (start-segment segment)) (x-point (end-segment segment))) 2)
        (/ (+ (y-point (start-segment segment)) (y-point (end-segment segment))) 2)))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display " - ")
  (display (y-point p))
  (display ")"))

(define segment1 (make-segment (cons 1 2) (cons 3 4)))
(define segment2 (make-segment (cons 5 6) (cons 7 8)))

(print-point (start-segment segment1))
(print-point (end-segment segment1))
(print-point (midpoint-segment segment1))

(print-point (start-segment segment2))
(print-point (end-segment segment2))
(print-point (midpoint-segment segment2))



