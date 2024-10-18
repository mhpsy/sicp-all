#lang scheme
(require (only-in "../../lib/accumulate.rkt" fold-right fold-left))

(define (reverse-right seq)
  (fold-right (lambda (x y) (append y (list x))) '() seq))

(define (reverse-left seq)
  (fold-left (lambda (x y) 
;   (display x) (display " ") (displayln y) 
  (append (list x) y)) '() seq))

(reverse-right (list 1 2 3 4 5))
(reverse-left (list 1 2 3 4 5))
