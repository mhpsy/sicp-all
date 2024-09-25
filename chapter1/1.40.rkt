#lang scheme

(define tolerance 0.00001)
(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))

(define (fixed-point f first-guess)
  (define (try guess)
    (let ((next (f guess)))
      (cond ((close-enough? guess next)
             next)
            (else (try next)))))
  (try first-guess))

(define (average-damp f)
  (define (average x y)
    (/ (+ x y) 2))
  (lambda (x) (average x (f x))))


; 获取导数函数
(define (deriv g)
  (define dx 0.00001)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

; 获取牛顿法的transform
(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

; 获取牛顿法的函数
(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))


(define (sqrt1 x)
  (newton-method (lambda (y) (- (* y y) x)) 1.0))

(sqrt1 2)

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (sqrt2 x)
  (fixed-point-of-transform (lambda (y) (- (* y y) x)) newton-transform 1.0))

(sqrt2 2)

; (define (cubic x)
;   (- (* x x x) (* 2 x) 3))

; (define (cubic-root x)
;   (fixed-point-of-transform (lambda (y) (- (* y y y) x)) newton-transform 1.0))

(define (cubic a b c)
  (lambda (x)
    (+ (* x x x) (* a x x) (* b x) c)))

(define (cubic-root a b c)
    (newton-method (cubic a b c) 1.0))

(cubic-root 1 2 3)
(cubic-root -3 3 -1)


