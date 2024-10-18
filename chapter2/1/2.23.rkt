#lang scheme

(define (my-for-each proc items)
  (if (null? items)
      '()
      ((proc (car items))
       (my-for-each proc (cdr items)))
      ))

(define (my-for-each-2 proc items)
  (if (null? items)
      '()
      (begin
        (proc (car items))
        (my-for-each-2 proc (cdr items)))))

(define fn (lambda (x) (newline) (display x)))
; (my-for-each fn (list 1 2 3 4))
(my-for-each-2 fn (list 1 2 3 4))

(for-each fn (list 1 2 3 4))
