(define (filtered-accumulate combiner filter null-value term a next b)
  (cond ((> a b) null-value)
	((filter a) (combiner (filtered-accumulate combiner filter null-value term (next a) next b) null-value))
	(else (combiner (filtered-accumulate combiner filter null-value term (next a) next b) (term a)))))
;Value: filtered-accumulate

(define (sum-of-positive a b)
  (filtered-accumulate +
                       (lambda (x) (< x 0))
                       0
                       (lambda (x) x)
                       a
                       (lambda (x) (+ x 1))
                       b))
;Value: sum-of-positive

(sum-of-positive -5 5)
;Value: 15

(define (sum-of-squares-of-prime-numbers a b)
  (filtered-accumulate +
		       (lambda (x) (if (prime? x) #f #t))
		       0
		       (lambda (x) (square x))
		       a
		       (lambda (x) (+ x 1))
		       b))
;Value: sum-of-squares-of-prime-numbers

(define (product-of-all-positive-numbers-less-than-n-relatively-prime-to-n n)
  (filterd-accumulate *
		      (lambda (x) (if (= (gcd x n) 1) #f #t))
		      1
		      (lambda (x) x)
		      1
		      (lambda (x) x+1)
		      (- n 1)))
;Value: product-of-all-positive-numbers-less-than-n-relatively-prime-to-n

