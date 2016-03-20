(define (average x y)
  (/ (+ x y) 2))
;Value: average

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

(define (average-damp f)
  (lambda (x) (average x (f x))))
;Value: average-damp

(define (deriv g)
  (let ((dx 0.00001))
    (lambda (x) (/ (- (g (+ x dx)) (g x)) dx))))
;Value: deriv

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))
;Value: fixed-point-of-transform

(define (newtons-method g guess)
  (define (newton-transform g)
    (lambda (x) (- x (/ (g x) ((deriv g) x)))))
  (fixed-point-of-transform (newton-transform g) average-damp guess))
;Value: newtons-method

(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a x x) (* b x) c)))
;Value: cubic

(newtons-method (cubic 2 3 4) 1)
;Value: -1.650620338609335

