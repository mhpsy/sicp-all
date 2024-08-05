#lang scheme

; term: 怎么处理每个元素 (term a)
; a: 开始的元素
; next: 下一个元素 (next a)
; b: 结束的元素
; f: 怎么处理每个元素的结果 (f a result)
; init: 初始值
; is-end?: 判断是否结束 (is-end? a b)
; filter: 过滤器
(define (accumulate term a next b f init is-end? filter)
  (define (iter a result)
    (if (is-end? a b)
        result
        ; 如果满足过滤器就执行f(term a) result 不然依旧用旧的result
        (if (filter a)
            (iter (next a) (f (term a) result))
            (iter (next a) result))))
  (iter a init))

(require (only-in "1.21.rkt" prime?))

; 计算 x 到 y 之间素数的和
(define (sum-prime x y)
  (accumulate
   (lambda (x) x)
   x
   (lambda (x)(+ x 1))
   y
   (lambda (x y)(+ x y))
   0
   (lambda (x y)(> x y))
   prime?)
  )

(sum-prime 1 10)
; 1 + 2 + 3 + 5 + 7 = 18

(sum-prime 1 100)
; 1061

; 计算小于n的所有与n互素数（最大公约数为1）的数的和

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; 闭包
(define (relatively-prime n)
  (lambda (x)(= 1 (gcd x n))))

(define (sum-relatively-prime n)
  (accumulate
   (lambda (x) x)
   1
   (lambda (x)(+ x 1))
   n
   (lambda (x y)(+ x y))
   0
   (lambda (x y)(> x y))
   (relatively-prime n)))

(sum-relatively-prime 10)
; 1 + 3 + 7 + 9 = 20
