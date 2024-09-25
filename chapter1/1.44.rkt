#lang scheme

(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx))
                    (f x)
                    (f (+ x dx)))
                 3)))

; 迭代的方式
(define (smooth-iter f n)
  (define (iter fn i)
    ; 应该是等于0才返回 因为1的时候是要迭代一次的
    (if (= i 0)
        fn
        (iter (smooth fn) (- i 1))))
  (iter f n) )

;获得一个平滑五次后的函数
(smooth-iter (lambda (x)(* x x)) 5)

((smooth-iter (lambda (x)(* x x)) 5) 5)


; repeated
; (define (repeated f n)
;   (if (= n 1)
;       f
;       (lambda (x)
;         ((let ((fn (repeated f (- n 1) x)))
;         (display (fn x))
;         (newline)
;            fn)))))

(define (repeated f n)
  (if (= n 1)
      f
      (lambda (x) (f ((repeated f (- n 1)) x)))))

(define (smooth-repeated f n)
; 先重复smooth足够的次数 先(smooth f) 在repeated 语义就不对了
; 因为只是重复smooth次数
  ((repeated smooth n)f))

((smooth-repeated (lambda (x) (* x x)) 5) 5)

