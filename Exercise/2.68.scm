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

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
;Value: symbols

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))
;Value: weight

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree
                    (make-leaf 'D 1)
		    (make-leaf 'C 1)))))
;Value: sample-tree

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))
;Value: encode

(define (encode-symbol symbol tree)
  (define (element-of-set? x set) 
    (cond ((null? set) false) 
	  ((equal? x (car set)) true) 
	  (else (element-of-set? x (cdr set)))))
 
  (define left?
    (element-of-set? symbol (symbols (left-branch tree))))

  (define right?
    (element-of-set? symbol (symbols (right-branch tree))))
  
  (cond (left? (if (leaf? (left-branch tree))
		    (cons '0 '())
		    (cons '0 (encode-symbol symbol (left-branch tree)))))
	(right? (if (leaf? (right-branch tree))
                    (cons '1 '())
                    (cons '1 (encode-symbol symbol (right-branch tree)))))
	(else #f)))
;Value: encode-symbol

(define msg '(a d a b b c a))
;Value: msg

(encode msg sample-tree)
;Value 18: (0 1 1 0 0 1 0 1 0 1 1 1 0)