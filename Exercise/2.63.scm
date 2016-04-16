;left link points to elements smaller than the one at the node

(define (entry tree)
  (car tree))
;Value: entry

(define (left-branch tree)
  (cadr tree))
;Value: left-branch

(define (right-branch tree)
  (caddr tree))
;Value: right-branch

(define (make-tree entry left right)
  (list entry left right))
;Value: make-tree

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set))
         (element-of-set? x (left-branch set)))
        ((> x (entry set))
         (element-of-set? x (right-branch set)))))
;Value: element-of-set?

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree (entry set)
                    (adjoin-set x (left-branch set))
                    (right-branch set)))
        ((> x (entry set))
	 (make-tree (entry set) (left-branch set)
                    (adjoin-set x (right-branch set))))))
;Value: adjoin-set

(define tree1 '(7 (3 (1 () ()) (5 () ())) (9 () (11 () ()))))
;Figure 2.16 a
;Value: tree1

(define tree2 '(3 (1 () ()) (7 (5 () ()) (9 () (11 () ())))))
;Figure 2.16 b
;Value: tree2

(define tree3 '(5 (3 (1 () ()) ()) (9 (7 () ()) (11 () ()))))
;Figure 2.16 c
;Value: tree3

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1
		     (right-branch tree))))))
;Value: tree->list-1

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))
;Value: tree->list-2

(tree->list-1 tree1)
;Value 14: (1 3 5 7 9 11)

(tree->list-1 tree2)
;Value 15: (1 3 5 7 9 11)

(tree->list-1 tree3)
;Value 16: (1 3 5 7 9 11)

(tree->list-2 tree1)
;Value 17: (1 3 5 7 9 11)

(tree->list-2 tree2)
;Value 18: (1 3 5 7 9 11)

(tree->list-2 tree3)
;Value 19: (1 3 5 7 9 11)

;the two procedures produce the same result for every tree

;tree->list1 O(nlogn)
;tree->list2 O(n)

;tree rotation does not affect the result of in-order traversal