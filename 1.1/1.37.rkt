#lang scheme

(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1))

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 10)
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 100)


(define (cont-frac2 n d k)
  (define (iter i temp)
    (if (= i k)
        temp
        (iter
         (+ i 1)
         ; d(i) + temp 会被当成一个整体继续下去
         (/ (n i) (+ (d i) temp))
         )))
  (iter 1 0))

(define (cont-frac3 n d k)
  (define (iter i temp)
    (if (= i 0)
        temp
        (iter
         (- i 1)
         (/ (n i) (+ (d i) temp))
         )))
    (iter (- k 1) (/ (n k) (d k))))

(cont-frac2 (lambda (i) 1.0) (lambda (i) 1.0) 10)
(cont-frac3 (lambda (i) 1.0) (lambda (i) 1.0) 10)



