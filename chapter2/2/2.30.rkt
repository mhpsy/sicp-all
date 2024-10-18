#lang scheme

(define (scale-tree tree factor)
  (cond ((null? tree) '())
        ((not (pair? tree)) (* tree factor))
        (else (cons (scale-tree (car tree) factor)
                    (scale-tree (cdr tree) factor)))))

(define (scale-tree-2 tree factor)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (scale-tree-2 sub-tree factor)
             (* sub-tree factor)))
       tree))

(define arr (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(scale-tree arr 10)
(scale-tree-2 arr 10)

(define (tree-map tree fn)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             ;; 如果是子树，则递归调用 tree-map
             (tree-map sub-tree fn)
             ;; 如果不是子树，则直接应用 fn
             (fn sub-tree)))
       tree))

(tree-map arr (lambda (x) (* x 5)))




