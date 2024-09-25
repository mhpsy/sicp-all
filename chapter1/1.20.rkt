#lang scheme

(define (gcd a b)
 (if (= b 0)
     a
     (gcd b (remainder a b))))

(gcd 206 40)

; 正则序是尽可能展开然后计算
; 应用序是先计算参数，然后再应用

; 正则序
; (gcd 206 40)
; (gcd 40 (remainder 206 40))
; (gcd 40 6)
; (gcd 6 (remainder 40 6))
; (gcd 6 4)
; (gcd 4 (remainder 6 4))
; (gcd 4 2)
; (gcd 2 (remainder 4 2))
; 正则序列会多算if外面的gcd 2 0
; (if (= 2 0) 2 (gcd 2 (remainder 4 2)))
; (if #f 2 (gcd 2 (remainder 4 2)))
; 2
; 一种执行了5次 remainder

; 应用序
; (gcd 206 40)
; (gcd 40 (remainder 206 40))
; (gcd 40 6)
; (gcd 6 (remainder 40 6))
; (gcd 6 4)
; (gcd 4 (remainder 6 4))
; (gcd 4 2)
; (gcd 2 (remainder 4 2))
; (gcd 2 0)
; 2
; 一种执行了4次 remainder



