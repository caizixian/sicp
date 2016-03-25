(define (cons x y)
  (lambda (m) (m x y)))
;Value: cons

(define (car z)
  (z (lambda (p q) p)))
;Value: car

(define (cdr z)
  (z (lambda (p q) q)))
;Value: cdr

(define pair (cons 1 2))
;Value: pair

(car pair)
;Value: 1

(cdr pair)
;Value: 2

