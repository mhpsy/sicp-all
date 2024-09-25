#lang scheme

(define (expt x n)
  (if(= n 0)
     1
     (* x (expt x (- n 1)))))

(expt 2 3)

(define (expt2 x n)
  (define (expt-iter x count temp)
    (if (= count 0)
        temp
        (expt-iter
         x
         (- count 1)
         (* x temp))))
  (expt-iter x n 1))

(expt2 2 3)

(define (even? n)(= (remainder n 2) 0))
(define (square n)(* n n))

(define (fast-expt x n)
  (cond
    ((= n 0) 1)
    ((even? n)(square (fast-expt x (/ n 2))))
    (else (* x (fast-expt x (- n 1))))))

(fast-expt 2 3)

(define (fast-expt2 b n)
  (define (fast-expt-iter b n a)
    (cond ((= n 0) a)
          ((even? n)  (fast-expt-iter (square b) (/ n 2) a)) ; (b^(n/2))^2
          (else (fast-expt-iter b (- n 1) (* b a)))))
  (fast-expt-iter b n 1))


(fast-expt2 2 3)
(fast-expt2 2 4)


