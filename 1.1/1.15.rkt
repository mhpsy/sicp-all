#lang scheme

(define (cube x) (* x x x))

(define (p x)(- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(sine 12.15)
(sine 12)
(sine 100)

; 时间复杂度
; 递归调用的次数
; 12.15/3 = 4.05
; 4.05/3 = 1.35
; 1.35/3 = 0.45
; 0.45/3 = 0.15
; 0.15/3 = 0.05 递归结束了 5次

; n/3 /3 /3 /3

; n/3^x < 0.1 求x
; log(n/3^x) < log(0.1)
; n > (log(n) - log(0.1)) / log(3)

; 去掉常数 结果是O(logn)



