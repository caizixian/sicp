(remainder 3 2)
;Value: 1

(define (even? n)
  (= (remainder n 2) 0))
;Value: even?

(define (square x)
  (* x x))
;Value: square

(define (fast-expt b n)
  (fast-expt-iter b n 1))
;Value: fast-expt

(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (square b) (/ n 2) a)) ;b^n->(b^2)^(n/2)
        (else (fast-expt-iter b (- n 1) (* a b)))))
;Value: fast-expt-iter

(fast-expt 2 2)
;Value: 4

(fast-expt 3 9)
;Value: 19683

(fast-expt 3 11)
;Value: 177147