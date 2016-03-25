(define (cons a b)
  (* (expt 2 a) (expt 3 b)))
;Value: cons

(define (car z)
  (define (iter num count)
    (if (= (remainder num 2) 0)
	(iter (/ num 2) (+ count 1))
	count))
  (iter z 0))
;Value: car

(define (cdr z)
  (define (iter num count)
    (if (= (remainder num 3) 0)
	(iter (/ num 3) (+ count 1))
	count))
  (iter z 0))
;Value: cdr

(car (cons 4 5))
;Value: 4

(cdr (cons 4 5))
;Value: 5