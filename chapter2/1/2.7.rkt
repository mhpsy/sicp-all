#lang scheme

;; 加法
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

;; 乘法
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

;; 除法 第一个区间 * 第二个区间的倒数
(define (div-interval x y)
  (if (or (= (lower-bound y) 0) (= (upper-bound y) 0))
      (error "除数区间包含0")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

;; 区间构造函数
(define (make-interval a b) (cons a b))
(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (upper-bound interval) (max (car interval) (cdr interval)))

;; 减法
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

;; 区间宽度
(define (width-interval interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2))

;; 测试
(define x (make-interval 1 2))
(define y (make-interval 3 5))
(add-interval x y)
(mul-interval x y)
(div-interval x y)
(width-interval x); 1/2
(width-interval y); 1

(define (mul-interval-2 x y)
  (let ((lx (lower-bound x))
        (ux (upper-bound x))
        (ly (lower-bound y))
        (uy (upper-bound y)))
    (cond
      ;; x 和 y 都是正区间
      ((and (>= lx 0) (>= ly 0))
       (make-interval (* lx ly) (* ux uy)))

      ;; x 是正区间，y 跨越 0
      ((and (>= lx 0) (< ly 0) (> uy 0))
       (make-interval (* ux ly) (* ux uy)))

      ;; x 是正区间，y 是负区间
      ((and (>= lx 0) (< uy 0))
       (make-interval (* ux ly) (* lx uy)))

      ;; x 跨越 0，y 是正区间
      ((and (< lx 0) (> ux 0) (>= ly 0))
       (make-interval (* lx uy) (* ux uy)))

      ;; x 和 y 都跨越 0
      ((and (< lx 0) (> ux 0) (< ly 0) (> uy 0))
       (make-interval (min (* lx uy) (* ux ly))
                      (max (* lx ly) (* ux uy))))

      ;; x 跨越 0，y 是负区间
      ((and (< lx 0) (> ux 0) (< uy 0))
       (make-interval (* ux ly) (* lx ly)))

      ;; x 是负区间，y 是正区间
      ((and (< ux 0) (>= ly 0))
       (make-interval (* lx uy) (* ux ly)))

      ;; x 是负区间，y 跨越 0
      ((and (< ux 0) (< ly 0) (> uy 0))
       (make-interval (* lx uy) (* lx ly)))

      ;; x 和 y 都是负区间
      ((and (< ux 0) (< uy 0))
       (make-interval (* ux uy) (* lx ly))))))

;; 测试
(define x1 (make-interval 1 2))
(define y1 (make-interval 3 5))
(mul-interval-2 x1 y1)

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (let ((w (* c (/ p 100.0))))
    (make-center-width c w)))

;; 这里其实还能用另一种方式 就是新建的时候 存上 百分比 但是需要再套一层
(define (percent i)
  (* (/ (width i) (center i)) 100))

;; 测试
(define x2 (make-center-percent 100 10))
(center x2);; 上下10% 还是100
(width x2)
(width-interval x2)
(percent x2)

;; 2.13 在误差为很小的百分数的条件下，存在着一个简单公式，利用它可以从两个被乘区间的误差算出乘积的百分数误差值。
;; 你可以假定所有的数为正，以简化这一问题
;; 没明白要我干什么

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

;; 
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

;; test
(define r1 (make-center-percent 100 10))
(define r2 (make-center-percent 200 10))
(par1 r1 r2)
(par2 r1 r2)
;; (49.09090909090909 . 89.62962962962963)
;; (60.0 . 73.33333333333334)

;; 2.14
(define rr1 (make-center-percent 200 0.5));; 199 201
(define rr2 (make-center-percent 400 0.5));; 398 402
(mul-interval rr1 rr2)
(add-interval rr1 rr2)
(define mul-rr1-rr2 (mul-interval rr1 rr2))
(define add-rr1-rr2 (add-interval rr1 rr2))
(newline)
(div-interval mul-rr1-rr2 add-rr1-rr2)
(newline)
(par1 rr1 rr2)
(par2 rr1 rr2)

;; 对于并联电阻的计算，使用中心值和百分比误差的方法可能会得到更准确的结果
(define (par2-center-percent r1 r2)
  (let ((c1 (center r1))
        (c2 (center r2))
        (p1 (percent r1))
        (p2 (percent r2)))
    (let ((result-center (/ (* c1 c2) (+ c1 c2)))
          (result-percent (+ p1 p2))) ; 这是一个简化的误差传播，实际情况可能更复杂
      (make-center-percent result-center result-percent))))

(par2-center-percent rr1 rr2)

;; 2.15 
;; 我认为怕par2 是更不好的程序,因为它计算次数更多 并且是难(除法 乘法)的计算次数
;; 而par1 是更简单的计算
;; 理论上应该par1 精度更高

;; 2.16
;; 1. 为什么等价的代数表达式在计算区间时候有差异
;; 有一个很基本的理由就是 每次运算都可能引入额外的误差
;; 2. 你能设计出一个区间算法包,使之没有这种缺陷吗? 或者这件事情根本就不可能做到
;; 我感觉是可以搞的 只要用前面提到的church计数 (完全的函数计算)
;; 这样每次都是用函数来计算 而不是用具体的数值
;; 这样就可以避免每次运算都引入额外的误差
;; 知道需要结果的时候在进行真正的计算



