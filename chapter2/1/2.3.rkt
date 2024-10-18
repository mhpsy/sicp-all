#lang scheme

(define (make-rectangle width height)
  (cons width height))

(define (width-rectangle rect)
  (car rect))

(define (height-rectangle rect)
  (cdr rect))

(define (area-rectangle rect)
  (* (width-rectangle rect) (height-rectangle rect)))

(define (perimeter-rectangle rect)
  (* 2 (+ (width-rectangle rect) (height-rectangle rect))))


(define rect1 (make-rectangle 10 20))
(display (area-rectangle rect1))
(newline)
(display (perimeter-rectangle rect1))
(newline)