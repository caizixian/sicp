(define (compose f g)
  (lambda (x) (f (g x))))
;Value: compose

(define (repeated f count)
  (if (= count 0)
      f
      (compose f f)))
;Value: repeated

(define (square x)
  (* x x))
;Value: square

((repeated square 2) 5)
;Value: 625

