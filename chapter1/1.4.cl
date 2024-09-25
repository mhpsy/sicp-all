#|
1.4:
- Author: mhpsy
- Date: 2024-07-21
|#


(defun a-plus-abs-b (a b)
  ((if (> b 0) + -)
      a b)
)

(defun a-plus-abs-b (a b)
  (funcall (if (>= b 0) #'+ #'-) a b))

(print
    (a-plus-abs-b -10 10)
)

(print
    (a-plus-abs-b 10 10)
)


