(define (square x)
  (* x x))
;Value: square

(square 2)
;Value: 4

(define (sum-of-squares x y)
  (+ (square x)
     (square y)))
;Value: sum-of-squares

(sum-of-squares 3 4)
;Value: 25

(define (sum-of-squares-of-two-larger-number x y z)
  (cond ((>= x y) (cond ((>= y z) (sum-of-squares x y))
			(else (sum-of-squares x z))))
	(else (cond ((>= x z) (sum-of-squares y x))
		    (else (sum-of-squares y z))))))
;Value: sum-of-squares-of-two-larger-number

(sum-of-squares-of-two-larger-number 3 1 1)
;Value: 10