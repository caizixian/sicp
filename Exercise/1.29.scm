;Procedure as arguments

(define (simpson-integral f a b n)
  (let ((h (/ (- b a) n)))
    (* (/ h 3) (simpson-sum f a h n))))
;Value: simpson-integral

(define (simpson-sum f a h n)
  (define (kth-term k)
    (cond ((= k 0) (f a))
	  ((= k n) (f (+ a (* n h))))
	  ((= (remainder k 2) 0) (* 2 (f (+ a (* k h)))))
	  ((= (remainder k 2) 1) (* 4 (f (+ a (* k h)))))))
  (define (iter count sum)
    (if (< count 0)
	sum
	(iter (- count 1) (+ sum (kth-term count)))))
  (iter n 0))
;Value: simpson-sum

(define (cube x)
  (* x x x))
;Value: cube

(simpson-integral cube 0 1 100)
;Value: 1/4

(simpson-integral cube 0 1 1000)
;Value: 1/4
