#lang scheme
(require (only-in "../../lib/accumulate.rkt" accumulate))

(define (count-leaves tree)
  (accumulate
   + 0
   (map
    (lambda (sub-tree)
      (if (pair? sub-tree)
          (count-leaves sub-tree)
          1))
    tree)))


(define (count-leaves-2 tree)
  (accumulate
   (lambda (sub-tree result)
     (+ result (if (pair? sub-tree)
                   (count-leaves-2 sub-tree)
                   1)))
   0
   tree))

(define x (list (list 1 2) (list 3 4)))
(count-leaves x)
(count-leaves-2 x)
