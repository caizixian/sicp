(define (mul a b)
  (mul-iter a b 0))
;Value: mul

(define (even? n)
  (= (remainder n 2) 0))
;Value: even?

(define (mul-iter a b sum)
  (cond ((= b 0) sum)
	((even? b) (mul-iter (* a 2) (/ b 2) sum))
	(else (mul-iter a (- b 1) (+ a sum)))))
;Value: mul-iter

(mul 2 3)
;Value: 6

(mul 3 9)
;Value: 27

(mul 3 7)
;Value: 21