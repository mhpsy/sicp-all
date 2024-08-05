#lang scheme

(define (sum term a next b)
  (define (iter a result)
    (if(> a b)result
       (iter (next a)(+ (term a) result))))
  (iter a 0))


(sum (lambda (x) (* x x x)) 1 (lambda (x)(+ x 1)) 10)
;3025