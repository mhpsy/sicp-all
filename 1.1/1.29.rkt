#lang scheme

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


(define (cube x)(* x x x))
(define (inc x)(+ x 1))

(define (sum-cubes a b)
  (sum cube a inc b))

(sum-cubes 1 10)

(define (integral f a b dx)
  (define (add-dx x)(+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)


(define (xps f a b n)
  ; h = (b - a) / n
  (define h (/ (- b a) n))
  ; y(k) = f(a + k * h)
  (define (get-y k)(f (+ a (* k h))))
  ; 获取前面的乘数字
  (define (get-times-num x)
    (cond ((or (= x 1) (= x n))1)
          ((= (remainder x 2)0)4)
          (else 2)))
  ; 计算总和
  (define (weighted-sum k)
    (* (get-y k) (get-times-num k)))

  ; 计算
  (* (/ h 3.0)
     (sum weighted-sum
          0
          (lambda (x)(+ x 1))
          n))
  )

(xps cube 0 1 100)
(xps cube 0 1 1000)
(xps cube 0 1 10000)



