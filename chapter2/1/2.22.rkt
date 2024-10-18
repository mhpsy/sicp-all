#lang scheme

(define (square x) (* x x))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              ;; 因为这里就是这样放的 先放 当前的 再放之前的答案
              (cons (square (car things))
                    answer))))
  (iter items '()))

(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              ;; 这里的结果是因为 每次都是cons 应该用append
              (cons answer
                    (square (car things))))))
  (iter items '()))


(define (square-list-3 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer
                      (list(square (car things)))))))
  (iter items '()))


(square-list (list 1 2 3 4 5 6 7 8 9 10))
(square-list-2 (list 1 2 3 4 5 6 7 8 9 10))
(square-list-3 (list 1 2 3 4 5 6 7 8 9 10))
