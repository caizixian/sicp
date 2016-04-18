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

(define rocktree (generate-huffman-tree '((A 2) (NA 16) (BOOM  1) (SHA 3) (GET 2) (YIP 9) (JOB 2) (WAH 1)))) 
;Value: rocktree

(define rock-song '(Get a job Sha na na na na na na na na Get a job Sha na na na na na na na na Wah yip yip yip yip yip yip yip yip yip Sha boom)) 
;Value: rock-song

(encode rock-song rocktree)
;Value 13: (1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 1 0 1 1)

;eight-symbol alphabet->3 bits per symbol
;36 symbols -> 108 bits
;Huffman encoding -> 84 bits