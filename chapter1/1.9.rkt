#lang scheme

(define (inc x)(+ x 1))

(define (dec x)(- x 1))

(define (add x y)
  (if (= x 0)
      y
      (inc (add (dec x) y))))

(add 2 3)

; (add 2 3)
; (inc (add 1 3))
; (inc (inc (add 0 3)))
; (inc (inc 3))
; (inc 4)
; 5

(define (add-2 x y)
  (if (= x 0)
      y
      (add-2 (dec x) (inc y))))

(add-2 2 3)

; (add-2 2 3)
; (add-2 1 4)
; (add-2 0 5)
; 5

