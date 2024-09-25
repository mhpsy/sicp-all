#lang scheme

(define (repeated f n)
  (if (= n 0)
      (lambda (x) x)
      (if (= n 1)
          f
          (lambda (x) (f ((repeated f (- n 1)) x))))))

(define (average-damp f)
  (define (average x y)
    (/ (+ x y) 2))
  (lambda (x)
    (let ((result (average x (f x))))
      ; (display "Average of ")
      ; (display x)
      ; (display " and ")
      ; (display (f x))
      ; (display " is ")
      ; (display result)
      ; (newline)
      result)))


; 获得到repeat的average-damp
(define (repeated-average-damp f n)
  ((repeated average-damp n) f))

((repeated-average-damp (lambda (x) (* x x)) 5) 4.0)
; 4 16 res 10
; 4 10 res 7
; 4 7 res 5.5
; 4 5.5 res 4.75
; 4 4.75 res 4.375
((repeated-average-damp (lambda (x) (* x x)) 100) 4.0)


; 幂函数 之前写过这里简单来了
(define (power-fn-temp x n) (if(= n 0)1 (* x (power-fn-temp x (- n 1)))))
(power-fn-temp 2 3)

; 用repeat来实现幂函数
(define (power-fn x n)
  (if (= n 0)
      1
      (let ((use-fn(repeated (lambda (y) (* x y)) (- n 1))))
        (use-fn x))))

(power-fn 2 3)
(power-fn 2 4)
(power-fn 2 5)


(display "1------------")

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
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

(display "2------------")


(define (fined-root n repeated-num)
  (lambda (x)
    (fixed-point
     (repeated-average-damp
      (lambda (y)
        (/ x (power-fn y (- n 1))))
      repeated-num)
     1.0)))

; (define (sqrt x)
  ; (fined-root 2 1))

; (display (sqrt 9))
; ((sqrt 9)1.0)
(power-fn 2 3)
(define sqrt (fined-root 2 1))

(display (sqrt 9))