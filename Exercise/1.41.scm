(define (double f)
  (lambda (x) (f (f x))))
;Value: double

((double 1+) 2)
;Value: 4

(((double (double double)) 1+) 5)
;Value: 21

(((double double) 1+) 2)
;Value: 6
