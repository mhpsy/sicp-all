#lang scheme

(define (factor term a next b f init)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (f (term a) result))))
  (iter a init))

(define (sum term a next b)
  (define
    (temp-fn)
    (factor term a next b (lambda (x y)(+ x y)) 0))
  (temp-fn))

(sum (lambda (x) (* x x x)) 1 (lambda (x)(+ x 1)) 10)

(define (product term a next b)
  (define
    (temp-fn)
    (factor term a next b (lambda (x y)(* x y)) 1))
  (temp-fn))

(product (lambda (x) x) 2 (lambda (x)(+ x 1)) 10)

; 直接全部都是函数式 都拆分出来了


; 计算pi
; 分子的规律 2 4 4 6 6 8 8 10 10
; 2*(n/2)向上取整
; 分母的规律 1 3 3 5 5 7 7 9 9
; 2*(n/2)向上取整 + 1
; (define (get-numerator n)
;   (cond ((= n 1)2)
;         ((= n 2)4)
;         (else (if (= (remainder n 2) 0)
;                   (* 2 (/ n 2))
;                   (+ 1 (* 2 (/ n 2)))))))

; (define (get-denominator n)
;   (if (= n 1) 3
;       (+ 1 (get-numerator n))))

(define (get-numerator i)
  (cond ((= i 1)2)
        ((= 0 (remainder i 2))(+ i 2))
        (else(+ i 1))))

(define (get-denominator i)
  (if (= 0 (remainder i 2))
      (+ i 1)
      (+ i 2)))

(define (get-pi n)
  (* 4 (exact->inexact(/ (product get-numerator 1 (lambda (x)(+ x 1)) n)
                         (product get-denominator 1 (lambda (x)(+ x 1)) n)) )))

; exact->inexact 如果不使用这个就会得到一个很长的分数
; 50216813883093446110686315385661331328818843555712276103168/540815759303979260102436278107946340658325327562941019837483

(get-pi 100)
(get-pi 1000)
(get-pi 10000)
(get-pi 1000000)
