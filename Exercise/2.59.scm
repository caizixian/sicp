;Sets as unordered lists

(define (element-of-set? x set)
  (cond ((null? set) false)
	((equal? x (car set)) true)
	(else (element-of-set? x (cdr set)))))
;Value: element-of-set?

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))
;Value: adjoin-set

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
	(else (intersection-set (cdr set1) set2))))
;Value: intersection-set

(define (union-set set1 set2)
  (cond ((null? set1) set2)
	((null? set2) set1)
	((element-of-set? (car set1) set2)
	 (union-set (cdr set1) set2))
	(else (cons (car set1) (union-set (cdr set1) set2)))))
;Value: union-set

(union-set '(1 2 4 5) '(4 6 3 2))
;Value 14: (1 5 4 6 3 2)