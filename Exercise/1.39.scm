(define (cont-frac-iter n d k)
  (define (iter count result)
    (if (= count 0)
	result
	(iter (- count 1) (/ (n count) (+ (d count) result)))))
  (iter k 0))
;Value: cont-frac-iter

(define (tan-cf x k)
  (cont-frac-iter (lambda (n)
		    (if (= n 1)
			x
			(- (* x x))))
		  (lambda (n)
		    (- (* n 2) 1))
		  k))
;Value: tan-cf

(exact->inexact (tan-cf 1 20))
;Value: 1.5574077246549023

		  