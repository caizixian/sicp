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

(define (sub-interval a b)
  (make-interval (- (lower-bound a) (upper-bound b))
		 (- (upper-bound a) (lower-bound b))))
;Value: sub-interval