#lang scheme

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      ; (display next)
      ; (newline)
      ; (display guess)
      ; (newline)
      (cond ((close-enough? guess next)
             next)
            (else (try next)))))
  (try first-guess))

; (fixed-point cos 1.0)

; (fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0)

; (define (sqrt x)
;   (fixed-point (lambda (y) (/ x y)) 1.0))
; 执行会就死循环

; (sqrt 9)

(define (sqrt x)
  (fixed-point (lambda (y)
                 (/(+ y (/ x y))2))
               1.0))

(sqrt 9)

; 5.0
; 1.0
; 3.4
; 5.0
; 3.023529411764706
; 3.4
; 3.00009155413138
; 3.023529411764706
; 3.000000001396984
; 3.00009155413138
; 3.0
; 3.000000001396984
; 3.0



(provide fixed-point)