#lang scheme

(define test (list 1 2 3 4 5 6 7 8 9 10))

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (length items)
  ;; null? 是内置的一个函数
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(list-ref test 3)
(length test)

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(append test (list 11 12 13 14 15))

(define (last-pair items)
  (if (null? (cdr items))
      (car items)
      (last-pair (cdr items))))

(last-pair test)








