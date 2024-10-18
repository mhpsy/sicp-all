#lang scheme

(define (fringe items)
  (define (iter use-items result)
    (cond ((null? use-items) result)
          ((pair? (car use-items))
           (iter (cdr use-items) (append result (fringe (car use-items)))))
          (else (iter (cdr use-items) (append result (list (car use-items)))))))
  (iter items '()))

(define x (list (list 1 2) (list 3 4)))
(fringe x)



