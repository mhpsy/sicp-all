#lang scheme

(define (f g) (g 2))

(f f)

; application: not a procedure;
;  expected a procedure that can be applied to arguments
;   given: 2
;   context...:
;    body of "d:\code\sicp-all\1.1\1.34.rkt"

; 我最开始以为是死循环 没想到是"类型错误"