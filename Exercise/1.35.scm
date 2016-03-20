(define (fixed-point f first-guess)
  (let ((tolerance 0.00001))
    (define (close-enough? v1 v2) 
      (< (abs (- v1 v2))
	 tolerance))
    (define (try guess)
      (let ((next (f guess)))
	(if (close-enough? guess next)
	    next
	    (try next))))
    (try first-guess)))
;Value: fixed-point

(fixed-point cos 1.0)
;Value: .7390822985224024

(define (golden-transformation x)
  (+ 1 (/ 1 x)))
;Value: golden-transformation

(fixed-point golden-transformation 1.0)
;Value: 1.6180327868852458

