(define (cont-frac n d k)
  (define (frac count)
    (if (> count k)
	0
	(/ (n count) (+ (d count) (frac (+ 1 count))))))
  (frac 1))
;Value: cont-frac

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   10)
;Value: .6179775280898876

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)
;Value: .6180555555555556

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           12)
;Value: .6180257510729613

(define (cont-frac-iter n d k)
  (define (iter count result)
    (if (= count 0)
	result
	(iter (- count 1) (/ (n count) (+ (d count) result)))))
  (iter k 0))
;Value: cont-frac-iter

(cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)
;Value: .6180555555555556