(define (square-list items) 
  (define (iter things answer)
    (if (null? things)
	answer
        (iter (cdr things)
              (cons (square (car things))
		    answer))))
  (iter items '()))
;Value: square-list

(square-list (list 1 2 3 4))
;Value 14: (16 9 4 1)

;reverse order->(cons (square (car things)) answer))

;change to->(cons answer (square (car things)))
;the list will start with '() and it won't be properly ended