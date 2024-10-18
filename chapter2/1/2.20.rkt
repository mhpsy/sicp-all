#lang scheme

;; 居然不支持用 = 比较两个布尔值
(define (bool-equal? a b)
  (if a
      (if b
          #t
          #f)
      (if b
          #f
          #t)))


(define (same-parity x . y)
  (define (iter items result)
    (if (null? items)
        result
        (let ((is-even (even? x)))
          (if (bool-equal? is-even (even? (car items)))
              (iter (cdr items) (append result (list (car items))))
              (iter (cdr items) result)))))
  (iter y (list x)))

(same-parity 1 1 2 3 4 5 6 7 8 9 10)
(same-parity 2 1 2 3 4 5 6 7 8 9 10)


(define (my-map proc items)
  (if (null? items)
      '()
      (cons (proc (car items)) (my-map proc (cdr items)))))

(my-map even? (list 1 2 3 4 5 6 7 8 9 10))

