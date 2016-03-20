(define (cont-frac-iter n d k)
  (define (iter count result)
    (if (= count 0)
	result
	(iter (- count 1) (/ (n count) (+ (d count) result)))))
  (iter k 0))
;Value: cont-frac-iter

(exact->inexact (+ 2 (cont-frac-iter (lambda (x) 1)
		     (lambda (x)
		       (cond ((= (remainder x 3) 0) 1)
			     ((= (remainder x 3) 1) 1)
			     ((+ (remainder x 3) 2) (* (/ (+ x 1) 3) 2))))
		     25)))
;Value: 2.718281828459045

