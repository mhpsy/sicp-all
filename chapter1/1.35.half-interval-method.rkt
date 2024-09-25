#lang scheme

(define (average x y)
  (/ (+ x y) 2))

(define (close-enough? x y)
  (< (abs (- x y)) 0.00001))

(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        ; 如果两个点足够接近就返回中点
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value)
                 ; 如果中点是正数，那么就在中点和pos-point之间继续搜索
                 (search f neg-point midpoint))
                ((negative? test-value)
                 ; 如果中点是负数，那么就在neg-point和中点之间继续搜索
                 (search f midpoint pos-point))
                (else midpoint))))))

(display (positive? 1))
(newline)
(display (positive? -1))

;half-interval-method 这个方法相当于是一个二分法 套了一层 search
;保证不同号 同号就报错
(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
        ; a和b都是运算之后的值 并且一正一负
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else (error "Values are not of opposite sign" a b)))))

(newline)

(display
 (half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3)) 1.0 2.0)
 )

(newline)

(display
 (half-interval-method sin 2.0 4.0)
 )


