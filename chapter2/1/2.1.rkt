#lang scheme

(define (gcd-old a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; 要让gcd能够处理负数
(define (gcd a b)
  (if (= b 0)
      (abs a)
      (gcd b (remainder (abs a) (abs b)))))

;; 一共三种情况，分子为负，分母为负，分子分母都为负
;; 只需要处理分母为负的情况 相当于分子分母都乘以-1 其他情况都是直接使用
;; 注：实际工作中，一般情况会保留原始的值，会在使用或者打印的时候才会化简约分
(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (< d 0)
        (cons (- (/ n g)) (- (/ d g)))
        (cons (/ n g) (/ d g)))))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))


(define one-half (make-rat 1 -2))
(define one-third (make-rat 1 3))

(add-rat one-half one-third)
;; -1/2 1/3 => -3/6 2/6 => -1/6
(mul-rat one-half one-third)
;; -1/2 1/3 => -1/6
(sub-rat one-half one-third)
;; -1/2 1/3 => -3/6 2/6 => -5/6
(div-rat one-half one-third)
;; -1/2 1/3 => -3/6 2/6 => -3/2
(equal-rat? one-half one-third)

