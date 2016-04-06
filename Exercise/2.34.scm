(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
;Value: accumulate

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
		(+ this-coeff (* x higher-terms)))
	      0
	      coefficient-sequence))
;Value: horner-eval

(horner-eval 3 '(4 3 2 1))
;Value: 58

;x^3+2x^3+3x^2+4

(horner-eval 2 (list 1 3 0 5 0 1))
;Value: 79