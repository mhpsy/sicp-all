#|
1.1:
- Author: mhpsy
- Date: 2024-07-21
|#

(defvar a 3)
(defvar b (+ a 1))

(print "----------------")

(print (+ a b (* a b)))

(print
    (= a b)
)

(print
    (= a 3)
)

(print
    (if (and (> b a) (< b (* a b)))
            b a)
    )

(print
    (cond
      ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (t 25)
))

(print (+ 2 (if (> b a) b a)))

(print
  (*
    (cond
      ((> a b) a)
      ((< a b) b)
      (t -1)
    )
  (+ a 1)))