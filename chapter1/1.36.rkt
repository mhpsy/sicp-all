#lang scheme

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display next)
      (newline)
      (display guess)
      (newline)
      (cond ((close-enough? guess next)
             next)
            (else (try next)))))
  (try first-guess))



(define (average-damp f)
  (define (average x y)
    (/ (+ x y) 2))
  (lambda (x) (average x (f x))))

(define formula
  (lambda (x) (/ (log 1000) (log x))))

(define (formula2 x)
  (/ (log 1000) (log x)))

(fixed-point formula 2.0)

(display "===============")
(newline)

(fixed-point formula2 2.0)

(display "===============")
(newline)

(fixed-point (average-damp formula) 2.0)
