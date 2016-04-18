(define (make-leaf symbol weight) (list 'leaf symbol weight))
;Value: make-leaf

(define (leaf? object) (eq? (car object) 'leaf))
;Value: leaf?

(define (symbol-leaf x) (cadr x))
;Value: symbol-leaf

(define (weight-leaf x) (caddr x))
;Value: weight-leaf

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))
;Value: make-code-tree

(define (left-branch tree) (car tree))
;Value: left-branch

(define (right-branch tree) (cadr tree))
;Value: right-branch

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))
;Value: weight

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
;Value: symbols

(define (adjoin-set x set)
  (cond ((null? set) (list x))
	((< (weight x) (weight (car set))) (cons x set))
	(else (cons (car set)
		    (adjoin-set x (cdr set))))))
;Value: adjoin-set

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair);symbols
                               (cadr pair));frequency
		    (make-leaf-set (cdr pairs))))))
;Value: make-leaf-set

(define (successive-merge leaf-set)
  (cond ((= (length leaf-set) 0) '())
	((= (length leaf-set) 1) (car leaf-set))
	(else
	 (successive-merge (adjoin-set (make-code-tree (car leaf-set)
						       (cadr leaf-set))
				       (cddr leaf-set))))))
;Value: successive-merge

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))
;Value: generate-huffman-tree

(define pairs '((A 8) (B 3) (C 1) (D 1) (E 1) (F 1) (G 1) (H 1)))
;Value: pairs

(generate-huffman-tree pairs)
;Value 21: ((leaf a 8) ((((leaf h 1) (leaf g 1) (h g) 2) ((leaf f 1) (leaf e 1) (f e) 2) (h g f e) 4) (((leaf d 1) (leaf c 1) (d c) 2) (leaf b 3) (d c b) 5) (h g f e d c b) 9) (a h g f e d c b) 17)