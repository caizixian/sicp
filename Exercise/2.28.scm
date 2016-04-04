(define (fringe tree)
  (cond ((null? tree) '())
	((pair? tree) (extend (fringe (car tree)) (fringe (cdr tree))))
	(else (list tree))))
;Value: fringe

(define (extend list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (extend (cdr list1) list2))))
;Value: extend

(define x (list (list 1 2) (list 3 4)))
;Value: x

(fringe x)
;Value 15: (1 2 3 4)

(fringe (list x x))
;Value 16: (1 2 3 4 1 2 3 4)

(fringe (list (list 1 2) (list 3 (list 4 5) 6)))
;Value 17: (1 2 3 4 5 6)