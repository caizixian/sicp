(define (square-tree tree)
  (cond ((null? tree) '())
	((pair? tree) 
	 (cons (square-tree (car tree)) (square-tree (cdr tree))))
	(else (square tree))))
;Value: square-tree

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;Value 14: (1 (4 (9 16) 25) (36 49))

(define (square-tree-map tree)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	     (square-tree-map sub-tree)
	     (square sub-tree)))
       tree))
;Value: square-tree-map

(square-tree-map
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;Value 15: (1 (4 (9 16) 25) (36 49))