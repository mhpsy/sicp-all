#lang scheme

(define (count-leaves tree)
  (cond ((null? tree) 0)
        ((not (pair? tree)) 1)
        (else (+ (count-leaves (car tree))
                 (count-leaves (cdr tree))))))

(define x (cons (cons 1 2) (cons 3 4)))
(count-leaves x)

(define tree (list 1 (list 2 (list 3 4))))
(count-leaves tree)
