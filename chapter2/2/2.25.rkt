#lang scheme

(define x (list 1 3 (list 5 7) 9))
(define y (list (list 7)))
(define z (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

;; cadr 是给组合使用
(cdr(car(cddr x)))
; (cdar(car(cddr x)))
(car(cdr(car(cddr x))))
(caar y)
(cadadr (cadadr (cadadr z)))

