(define (compose f g)
  (lambda (x) (f (g x))))
;Value: compose

((compose square 1+) 6)
;Value: 49

