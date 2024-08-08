#lang scheme

(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1))

(define (tan-cf x k)
  (define (n i)
    (if (= i 1) x (- (* x x))))
  (define (d i)
    (- (* 2 i) 1))
  (cont-frac n d k))


(tan-cf 10.0 20)
(tan 10.0)

(tan-cf 25.0 100)
(tan 25.0)

(display "===============")
(newline)

(tan-cf 25.0 10)
(tan 25.0)
;如果迭代的次数太少，会偏差很多 我还以为写错了

