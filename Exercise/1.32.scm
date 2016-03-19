(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (accumulate combiner null-value term (next a) next b) (term a))))
;Value: accumulate

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (combiner result (term a)))))
  (iter a null-value))
;Value: accumulate-iter

(define (product term a next b)
  (accumulate * 1 term a next b))
;Value: product

(product
 (lambda (x) x)
 1
 (lambda (x) (+ 1 x))
 5)
;Value: 120

(define (product-iter term a next b)
  (accumulate-iter * 1 term a next b))
;Value: product-iter

(product-iter 
 (lambda (x) x)
 1
 (lambda (x) (+ 1 x))
 5)
;Value: 120

(define (sum term a next b)
  (accumulate + 0 term a next b))
;Value: sum

(define (sum-cubes a b)
  (sum (lambda (x) (* x x x))
       a
       (lambda (x) (+ 1 x))
       b))
;Value: sum-cubes

(sum-cubes 1 10)
;Value: 3025

