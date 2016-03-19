(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (+ (term a) result))))
  (iter a 0))
;Value: sum

(define (sum-cubes a b)
  (sum (lambda (x) (* x x x))
       a
       (lambda (x) (+ 1 x))
       b))
;Value: sum-cubes

(sum-cubes 1 10)
;Value: 3025