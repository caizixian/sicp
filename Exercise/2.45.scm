(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
	(below painter (beside smaller smaller)))))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
	(beside painter (below smaller smaller)))))

(define (split proc1 proc2)
  (lambda (painter n)
    (if (= n 0)
	painter
	(let ((smaller ((split proc1 proc2) painter (- n 1)))))
	  (proc1 painter (proc2 smaller smaller)))))
;Value: split

