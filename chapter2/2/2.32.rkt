#lang scheme

;; 这道题目看了好一会才明白是要干啥

(define (subsets s)
  (if (null? s)
  ;; 这里返回的不是一个普通的空 是一个list的空
      (list '())
      (let ((rest (subsets (cdr s))))
        (display "rest:")
        (display rest)
        (newline)
        (display "s:")
        (display s)
        (newline)
        (display "car s:")
        (display (car s))
        (newline)
        (display "map:")
        (display (map (lambda (x) (cons (car s) x)) rest))
        (newline)
        ;; 因为纯函数 所以每次都是新的
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))


;; 每次递归在做什么
;; 1. 先递归的求出rest 结束条件是s为空 作为结果的第一个元素
;; 2. 然后求出map 将s的第一个元素添加到rest的每一个元素中
;; 3. 最后将rest和map进行append

(subsets (list 1 2 3))

(define s (list 3))
(define rest (list'()))

(map (lambda (x) (cons (car s) x)) rest)

; 1 2 3
; 2 3
; 3
; 3 (())
;
