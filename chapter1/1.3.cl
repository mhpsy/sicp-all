#|
1.3:
- Author: mhpsy
- Date: 2024-07-21
|#

(defun two_num_min (x y)
  (if (< x y) x y)
)

(print
    (two_num_min 2 5)
)

(defun three_num_min (x y z)
    (two_num_min
      (two_num_min x y)
      (two_num_min y z)
    )
)

(print (three_num_min 23 5 10))

(defun three_num_get_two_big_sum (x y z)
  (-
   (+ x y z)
    (three_num_min x y z)
      )
)

(defun test (a b) (+ a b))


(print (three_num_get_two_big_sum 23 5 10))





