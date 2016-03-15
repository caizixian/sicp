(define (square x)
  (* x x))
;Value: square

(define (divides? a b)
  (= (remainder b a) 0))
;Value: divides?

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
;Value: find-divisor

(define (smallest-divisor n)
  (find-divisor n 2))
;Value: smallest-divisor

(smallest-divisor 199)
;Value: 199

(smallest-divisor 1999)
;Value: 1999

(smallest-divisor 19999)
;Value: 7