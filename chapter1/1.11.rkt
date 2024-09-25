#lang scheme

(define (recursion n)
  (if (< n 3) n
      (+ (recursion (- n 1))
         (* 2 (recursion (- n 2)))
         (* 3 (recursion (- n 3))))))


(recursion 3)
(recursion 10)

; (define (fn n a b c temp)
;   (if (= temp n) a
;       (fn n (+ a (* 2 b) (* 3 c)) a b (+ temp 1))))

; (fn 10 2 1 0 2)

(define (recursion-iter n)
  (define (iter a b c count)
    (if (= count 0) a
        (iter (+ a (* 2 b) (* 3 c))
              a
              b
              (- count 1))))
  (if (< n 3)n (iter 2 1 0 (- n 2)))
  )

(recursion-iter 3)
(recursion-iter 10)

; 这里我花费了很多时间
; 最开始我是直接开始硬写的但是写不出来
; 后来是去模仿上面的fib弄个公式 找规律才能写迭代的
; 递归居然是很自然的写法，迭代是很不直观的？？？
; 然后再写出来的

; f(0) = 0; f(1) = 1; f(2) = 2
; > 3 的时候
; f(n) = f(n-1) + 2f(n-2) + 3f(n-3)
; f(n-1) = f(n-2) + 2f(n-3) + 3f(n-4)
; f(n-2) = f(n-3) + 2f(n-4) + 3f(n-5)

; f(3) = f(2) + 2f(1) + 3f(0) = 2 + 2 + 0 = 4
; f(4) = f(3) + 2f(2) + 3f(1) = 4 + 4 + 3 = 11
; f(5) = f(4) + 2f(3) + 3f(2) = 11 + 8 + 6 = 25

