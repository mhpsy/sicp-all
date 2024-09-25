#lang scheme

; (define (run n fn)
;   (if (> n 0)
;       (run (fn (- n 1)) fn)
;       0))

; (define (log x)
;   (display x)
;   (newline)x)

; (run 10 log)

(define (triangle n)

  ; 每一个元素都递归一次(效率很低)
  (define (element row col)
    (if (or (= col 0) (= col row))
        1
        (+ (element (- row 1) (- col 1))
           (element (- row 1) col))))

  ; 一个一个的打印 最后加一个空行
  (define (print-row row)
    (define (print-elements col)
      (cond
        ((<= col row)
         (display (element row col))
         (display " ")
         (print-elements (+ col 1)))))
    (print-elements 0)
    (newline))

  (define (print-triangle current-row)
    (cond
      ((< current-row n)
       (print-row current-row)
       (print-triangle (+ current-row 1)))))

  (print-triangle 0))

(triangle 5)

