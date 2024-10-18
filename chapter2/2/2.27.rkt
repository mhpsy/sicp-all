#lang scheme

(define (deep-reverse items)
  (define (iter use-items result)
    (display use-items)
    (display "----")
    (display result)
    (newline)
    (cond ((null? use-items) result)
          ((pair? (car use-items))
           ; 如果是序对，则递归调用deep-reverse
           (iter (cdr use-items) (cons (deep-reverse (car use-items)) result)))
          ; 否则，将当前元素（一定是原子）添加到结果中
          (else (iter (cdr use-items) (cons (car use-items) result)))))
  (iter items '()))

(define x (list (list 1 2) (list 3 4) (list 5 6 7 8)))
(pair? x)
(car x)
(cdr x)
(cdr (list 1 2 3 4))
(pair? (car x))
(pair? (car (car x)))

(cons 1 (list 3 4)) ;; (1 3 4)
(cons (list 1 2) (list 3 4)) ;; ((1 2) 3 4)
(list (list 1 2) (list 3 4)) ;; ((1 2) (3 4))

(deep-reverse x)


