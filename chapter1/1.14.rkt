#lang scheme

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 100)

(+ (cc 100 4) (cc 50 5))
; 分解 cc 100 4
(+ (cc 100 3) (cc 75 4))
(+ (cc 100 2) (cc 90 3))
(+ (cc 100 1) (cc 95 2))
(+ (cc 100 0) (cc 99 1))
(+ 0 (cc 99 1))

; 分解(cc 99 1)
(+ (cc 99 0) (cc 98 1))
(+ 0 (cc 98 1))
(+ (cc 98 0) (cc 97 1))
(+ 0 (cc 97 1))
; (cc amount 1) == (+ (cc amount 0) (cc (- amount 1) 1))
; 所以可以得到(cc x 1) = 1
; (cc 100 1) = 1

(+ (cc 100 1) (cc 95 2))
(+ 1 (cc 95 2))
(cc 95 2)

; (cc amount 2)
; (+ (cc amount 1) (cc (- amount 5) 2))
; amount=95
; (+ 1 (cc 90 2))
; (+ 1 (cc 90 1)(cc 85 2))
; (+ 1 1 (cc 85 2))
; (+ 1 1 (cc 85 1)(cc 80 2))
; (+ 1 1 1 (cc 80 2))
; 95 -> 80 + 3 | 95-80=15 | 95/5 = 19
; 又因为 (cc 5 2) = (+ (cc 5 1) (cc 0 2)) = 2 , 也即是最后一步是 2
; 所以 (cc 95 2) = 19 + 1 =20

; 所以(c 100 2) = 21

; 继续(cc 100 3)
(+ (cc 100 2) (cc 90 3))
(+ 21 (cc 90 3))
(+ 21 (cc 90 2)(cc 80 3))
(+ 21 19 (cc 80 3))
(+ 21 19 17 (cc 70 3))
(+ 21 19 17 15 (cc 60 3))
; 60 50 40 30 20 10
; (+ 21 19 17 15 13 11 9 7 5 3 (cc 10 3))
(+ 21 19 17 15 13 11 9 7 5 3 (cc 0 3))
(+ 21 19 17 15 13 11 9 7 5 3 1)

; (cc 100 3) = 121


; (cc amount 3) == (+ (cc amount 2) (cc (- amount 10) 3)) ==
; amount/5+1  +  (amount-10/5+1) + .....
; amount=100 可以 得到 21 + 19 + ... + 1



; 所以 (cc 100 3) = 121

(cc 100 3)

(cc 100 4)
(+ (cc 100 3 )(cc 75 4))
(+ 121 (cc 75 3) (cc 50 4))
; (cc 75 3)
; 75   65   55   45   35  25  15  5 最后一个是5
; 也就是(cc 5 3) = 2   通过 (+ (cc 5 2) (cc -5 3)) = 2
; 16 + 14 + 12 + 10 + 8 + 6 + 4 + 2
(+ 121 72 (cc 50 4))

; 这个时候规律也出来了
; (cc amount 4) == (+ (cc amount 3) (cc (- amount 25) 4))
; amount/5+1 + (amount-25/5+1) + ....
; amount=100 可以得到 121 + 72 + ... + 2

; n/2 * (a+l) n是项目数 a是首项 l是末项
; n = (a-l)/2 + 1

; 50
; a = 11 l = 1 n = 6
; 6/2 * (11+1) = 36

; 25
; a = 6 l = 2 n = 3
; 3/2 * (6+2) = 12

; 100   75   50   25   0
; 121 + 72 + 36 + 12 + 1
(+ 121 72 36 12 1)
; 所以(cc 100 4) = 242



(cc 100 5)
(+ (cc 100 4) (cc 50 5))
(+ 242 (cc 50 4) (cc 0 4))
(+ 242 1 (cc 50 4))
(+ 243 (cc 50 3) (cc 25 4))
(+ 243 36 (cc 25 3) (cc 0 4))
(+ 243 36 12 1)
; = 292

(cc 100 5)
; = 292




; 空间复杂度 O(n) 递归深度判断的 最多递归n次
; 时间复杂度 O(2^n) 每次递归2次 所以是2^n

