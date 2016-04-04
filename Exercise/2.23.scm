(define (my-for-each term sequence)
  (if (null? sequence)
      #t
      (begin (term (car sequence)) (my-for-each term (cdr sequence)))))
;Value: my-for-each

(my-for-each (lambda (x)
	       (newline)
	       (display x))
	     (list 57 321 88))

;57
;321
;88
;Value: #t