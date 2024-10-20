#lang scheme
(require (only-in "../../lib/accumulate.rkt" accumulate enumerate-interval flatmap))
(require (only-in "../../lib/prime.rkt" prime?))

(define n 6)

(define use-list-demo (accumulate
                       append
                       '()
                       (map
                        (lambda (x)
                          (map (lambda (y) (list x y))
                               (enumerate-interval 1 (- x 1))))
                        (enumerate-interval 1 n))))

(define use-list
  (flatmap
   (lambda (x)
     (map (lambda (y) (list x y))
          (enumerate-interval 1 (- x 1))))
   (enumerate-interval 1 n)))

; (displayln use-list-demo)
; (displayln use-list)

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define prime-sum-pairs
  (map make-pair-sum
       (filter prime-sum? use-list)))

(displayln prime-sum-pairs)

(define (permutations s)
  (if (null? s)
      (list '())
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
          sequence))

(displayln (permutations (list 1 2 3 4)))


;; 相当于上面的不考虑素数
(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(displayln (unique-pairs n))
