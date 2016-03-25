(define (make-interval a b) (cons a b))
;Value: make-interval

(define (upper-bound z)
  (if (> (car z) (cdr z))
      (car z)
      (cdr z)))
;Value: upper-bound

(define (lower-bound z)
  (if (< (car z) (cdr z))
      (car z)
      (cdr z)))
;Value: lower-bound

