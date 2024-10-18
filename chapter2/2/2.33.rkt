#lang scheme
(require (only-in "../../lib/accumulate.rkt" accumulate))

(define test (list 1 2 3 4 5))

(filter even? test)

(map (lambda (x) (* x x)) test)



(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(enumerate-interval 1 10)
(define use-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(enumerate-tree use-tree)

(accumulate + 0 test)
(accumulate * 1 test)


(define (sum-odd-squares tree)
  (accumulate + 0
              (map (lambda (x) (* x x))
                   (filter odd? (enumerate-tree tree)))))

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1)) (fib (- n 2))))))

;; 0-n的fib数 然后过滤偶数
(define (even-fibs n)
  (filter even?
          (map fib (enumerate-interval 0 n))))

(define (even-fibs-2 n)
  (accumulate cons '()
              (map fib (filter even? (enumerate-interval 0 n)))))

(sum-odd-squares use-tree)
(even-fibs 10)
(even-fibs-2 10)
; (cons 1 (cons 2 (cons 3 '())))

(display "test")
(newline)

(define (map-my op seq)
  (accumulate (lambda (x y) (cons (op x) y)) '() seq))

(map-my (lambda (x) (* x x)) test)

(define (append-my seq1 seq2)
  (accumulate cons seq2 seq1))

(append-my test (list 6 7))

(define (length-my seq)
  (accumulate (lambda (_x y) (+ 1 y)) 0 seq))

(length-my test)
(length-my use-tree)
