(define (make-accumulator init-value)
  (lambda (add-value)
    (set! init-value (+ init-value add-value))
    init-value))
;Value: make-accumulator

(define A (make-accumulator 5))
;Value: a

(a 10)
;Value: 15

(a 10)
;Value: 25