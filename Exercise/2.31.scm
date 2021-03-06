(define (tree-map proc tree)
  (map (lambda (subtree)
	 (if (pair? subtree)
	     (tree-map proc subtree)
	     (proc subtree)))
       tree))
;Value: tree-map

(define square (lambda (x) (* x x)))
;Value: square

(define (square-tree tree) (tree-map square tree))
;Value: square-tree

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;Value 14: (1 (4 (9 16) 25) (36 49))