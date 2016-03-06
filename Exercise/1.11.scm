(define (f n)
  (if (< n 3) n
      (+ (f (- n 1))
	  (* 2 (f (- n 2)))
	   (* 3 (f (- n 3))))))
;Value: f

(define (f1 n)
  (if (< n 3) n
      (f-iter 0 1 2 (- n 2))))
;Value: f1

(define (f-iter n3 n2 n1 count)
  (if (= count 0) n1
      (f-iter n2 n1 (+ n1
		       (* 2 n2)
		       (* 3 n3))
	      (- count 1))))
;Value: f-iter

(f1 4)
;Value: 11

(f 4)
;Value: 11

