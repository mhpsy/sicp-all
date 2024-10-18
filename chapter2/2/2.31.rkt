#lang scheme


(define arr (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(define (tree-map tree fn)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             ;; 如果是子树，则递归调用 tree-map
             (tree-map sub-tree fn)
             ;; 如果不是子树，则直接应用 fn
             (fn sub-tree)))
       tree))

(define (square-tree tree)
  (tree-map tree (lambda (x) (* x x))))


(square-tree arr)



