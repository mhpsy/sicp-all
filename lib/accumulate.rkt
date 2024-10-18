#lang scheme

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq) (accumulate op init (cdr seq)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    ; (displayln rest)
    (if (null? rest)
        result
        (iter
         (op (car rest) result)
         ;; 每次都 把rest取出来 到最后一个才会开始运行
         (cdr rest))))
  (iter initial sequence))

(define fold-right accumulate)

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

;; 相当于给每一个seq的返回值都直接append在一起 相当于打平一次
(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(provide accumulate accumulate-n fold-left fold-right enumerate-interval flatmap)