#lang scheme

(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

;; 相当于 取出来全部的2 一直除就好了
(define (car z)
  (if (= (remainder z 2) 0)
      (+ 1 (car (/ z 2)))
      0))

(define (cdr z)
  (if (= (remainder z 3) 0)
      (+ 1 (cdr (/ z 3)))
      0))

(define num1 (cons 4 3))
(define num2 (cons 3 4))

(car num1)
(cdr num1)
(car num2)
(cdr num2)




