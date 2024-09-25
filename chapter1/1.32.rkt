#lang scheme

; term: 怎么处理每个元素 (term a)
; a: 开始的元素
; next: 下一个元素 (next a)
; b: 结束的元素
; f: 怎么处理每个元素的结果 (f a result)
; init: 初始值
; is-end?: 判断是否结束 (is-end? a b)
(define (accumulate term a next b f init is-end?)
  (define (iter a result)
    (if (is-end? a b)
        result
        (iter (next a) (f (term a) result))))
  (iter a init))

