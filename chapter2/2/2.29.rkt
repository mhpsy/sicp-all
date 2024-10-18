#lang scheme

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

; (define (branch-length-by-mobile mobile)
;   (cadr mobile))

(define (branch-structure branch)
  (cdr branch))


(define (branch-weight branch)
  ; 计算分支的重量
  (let ((structure (branch-structure branch)))
    ; (display structure)
    ; (newline)
    (if (pair? structure)
        (total-weight structure)
        structure)))

(define (total-weight mobile)
  ; 计算整个的重量 跟上面的方法互相递归调用
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

; 计算一份分支的力矩
(define (branch-torque branch)
  (* (branch-length branch) (branch-weight branch)))

; 判断是否平衡
(define (balanced? mobile)
  (if (not (pair? mobile))
      ;; 到最后一个只会有一个数字 不会有结构体 所以就直接返回一个真
      (begin
        ; (display mobile)
        ; (newline)
        #t)
      (let ((left-branch (left-branch mobile))
            (right-branch (right-branch mobile)))
        (and (= (branch-torque left-branch) (branch-torque right-branch))
             (balanced? (branch-structure left-branch))
             (balanced? (branch-structure right-branch))))))

(define mobile1 (make-mobile (make-branch 1 1) (make-branch 2 2)))
(define mobile2 (make-mobile (make-branch 2 2) (make-branch 1 1)))
(define mobile3 (make-mobile (make-branch 1 1) (make-branch 1 1)))
(define mobile4 (make-mobile (make-branch 1 2) (make-branch 2 1)))

(balanced? mobile1)
(balanced? mobile2)
(balanced? mobile3)
(balanced? mobile4)
; (balanced? mobile5)


; (balanced? mobile6)

