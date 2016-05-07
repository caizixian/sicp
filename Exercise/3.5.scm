(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
	   (/ trials-passed trials))
	  ((experiment)
	   (iter (- trials-remaining 1)
		 (+ trials-passed 1)))
	  (else (iter (- trials-remaining 1)
		      trials-passed))))
  (iter trials 0))
;Value: monte-carlo

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))
;Value: random-in-range

(define (estimate-integral P x1 x2 y1 y2 trials)
  (define (exp)
    (P (random-in-range x1 x2) (random-in-range y1 y2)))
  (let ((monte-carlo-result (monte-carlo trials exp))
	(entire-area (* (- x2 x1) (- y2 y1))))
    (* monte-carlo-result entire-area)))
;Value: estimate-integral

(define (square x)
  (* x x))
;Value: square

(define (estimate-pi trials)
  (/
   (estimate-integral
    (lambda (x y) (<=
		   (+
		    (square (- x 5))
		    (square (- y 7)))
		   (square 3)))
    2.0 8.0
    4.0 10.0
    trials)
   9.0))
;Value: estimate-pi

(estimate-pi 100000)
;Value: 3.1426