(define (entry tree) (car tree))
;Value: entry

(define (left-branch tree) (cadr tree))
;Value: left-branch

(define (right-branch tree) (caddr tree))
;Value: right-branch

(define (make-tree entry left right) (list entry left right))
;Value: make-tree

(define (tree->list tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list
			     (right-branch tree)
			     result-list)))))
  (copy-to-list tree '()))
;Value: tree->list

(define (list->tree elements)
  (define (partial-tree elts n)
    (if (= n 0)
	(cons '() elts)
	(let ((left-size (quotient (- n 1) 2)))
	  (let ((left-result
		 (partial-tree elts left-size)))
	    (let ((left-tree (car left-result))
		  (non-left-elts (cdr left-result))
		  (right-size (- n (+ left-size 1))))
	      (let ((this-entry (car non-left-elts))
		    (right-result
		     (partial-tree
		      (cdr non-left-elts)
		      right-size)))
		(let ((right-tree (car right-result))
		      (remaining-elts
		       (cdr right-result)))
		  (cons (make-tree this-entry
				   left-tree
				   right-tree)
			remaining-elts))))))))
  (car (partial-tree elements (length elements))))
;Value: list->tree

(define (union-set tree1 tree2)
  (define (union-list set1 set2)
    (cond ((null? set1) set2)
          ((null? set2) set1)
          ((= (car set1) (car set2))
           (cons (car set1) (union-list (cdr set1) (cdr set2))))
          ((< (car set1) (car set2))
           (cons (car set1) (union-list (cdr set1) set2)))
          (else (cons (car set2) (union-list set1 (cdr set2))))))
  (list->tree (union-list (tree->list tree1)
                          (tree->list tree2))))
;Value: union-set

(define (intersection-set tree1 tree2)
  (define (intersection-list set1 set2)
    (if (or (null? set1) (null? set2))
        '()    
        (let ((x1 (car set1)) (x2 (car set2)))
          (cond ((= x1 x2)
                 (cons x1
                       (intersection-list (cdr set1)
                                          (cdr set2))))
                ((< x1 x2)
                 (intersection-list (cdr set1) set2))
                ((< x2 x1)
                 (intersection-list set1 (cdr set2)))))))
  (list->tree (intersection-list (tree->list tree1)
                                 (tree->list tree2))))
;Value: intersection-set