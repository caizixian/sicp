(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
;Value: accumulate

(define (count-leaves t)
  (accumulate +
	      0
	      (map
	       (lambda (subtree)
		 (if (pair? subtree)
		     (count-leaves subtree)
		     1))
	       t)))
;Value: count-leaves

(count-leaves (list (list 2 3) (list 5 6) 1 (list 7 8 9)))
;Value: 8


