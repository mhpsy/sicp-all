#lang scheme

(require (only-in "1.21.rkt" prime?))

(define (runtime)
  (current-milliseconds))

(define (timed-prime-test n)
  ;   (newline)
  ;   (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (cond ((prime? n)
         (newline)
         (display n)
         (display "  ")
         (display start-time)
         (display "  ")
         (display (runtime))
         (display "  ")
         (report-prime (- (runtime) start-time)))
        (else #f)))

(define (report-prime elapsed-time)
  (display elapsed-time))

; (define (search-for-primes n end)
;   (cond ((= n end) (newline))
;         (else (timed-prime-test n)
;               (search-for-primes (- n 1) end))))

; (search-for-primes 2000 1000)

(define (search-for-primes n end)
  (cond ((= n end) (newline))
        (else (timed-prime-test n)
              (search-for-primes (+ n 1) end))))

(search-for-primes 1000 2000)

; 怎么运行都是一样的 所以只分析一下吧
; 因为prime最差是从2到根号n 所以时间复杂度是O(根号n)
; 我没看到这个根号10是怎么来的
; 肯定是成正比的

; 1993  1722699362222  1722699362222 0
; 1997  1722699362222  1722699362222 0
; 1999  1722699362222  1722699362222 0
; (- 1722699362222 17226993622220)