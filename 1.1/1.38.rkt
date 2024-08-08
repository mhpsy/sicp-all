#lang scheme


(define (get-even n)
  (* n 2))

(define (D-fn i)
  (cond
    ((= i 1)1)
    ((= i 2)2)
    ; i-5 mod 3 如果等于0 就获取这个数字-5/3的个的偶数
    (
     (= (remainder (- i 5) 3) 0)
     (get-even (+(/(- i 5)3)2))
     )
    (else 1)
    ))



; (D-fn 1)
; (D-fn 2)
; (D-fn 3)
; (D-fn 4)
; (D-fn 5)
; (D-fn 6)
; (D-fn 7)
; (D-fn 8)
; (D-fn 9)
; (D-fn 10)
; (D-fn 11)

(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1))

; 这个的结果是错误的
(define (cont-frac2 n d k)
  (define (iter i temp)
    (if (= i k)
        temp
        (iter
         (+ i 1)
         ; d(i) + temp 会被当成一个整体继续下去
         (/ (n i) (+ (d i) temp))
         )))
  (iter 1 0))

(define (cont-frac3 n d k)
  (define (iter i temp)
    (if (= i 0)
        temp
        (iter
         (- i 1)
         (/ (n i) (+ (d i) temp))
         )))
    (iter (- k 1) (/ (n k) (d k))))

(define (e1 k)
  (+ 2.0 (cont-frac (lambda (i) 1.0) D-fn k))
  )

(define (e2 k)
  (+ 2.0 (cont-frac2 (lambda (i) 1.0) D-fn k))
  )

(define (e3 k)
  (+ 2.0 (cont-frac3 (lambda (i) 1.0) D-fn k))
  )

(e1 10)
(e2 10)

(e1 100)
(e2 100)

(e3 10)
(e3 100)