#lang scheme

(define (no-more? coin-values)
  (null? coin-values))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        ;; 跟以前一样 每个硬币继续调用除了自己剩下的 以及 减去自己的面值的
        (else (+ (cc amount (except-first-denomination coin-values))
                 (cc (- amount (first-denomination coin-values)) coin-values)))))

(define (except-first-denomination coin-values)
  (cdr coin-values))

(define (first-denomination coin-values)
  (car coin-values))

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(cc 100 us-coins)
(cc 100 uk-coins)


;; 更改顺序 结果都是一样的 
;; 所有可能的组合都会被计算，只是计算的顺序可能不同。
(define us-coins-2 (reverse us-coins))
(newline)
(printf "us-coins-2: ~a\n" us-coins-2)
(cc 100 us-coins-2)

(define us-coins-3 (list 1 10 5 25 50))
(newline)
(printf "us-coins-3: ~a\n" us-coins-3)
(cc 100 us-coins-3)
