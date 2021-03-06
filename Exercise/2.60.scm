;Sets as unordered lists which allow duplicate

(define (element-of-set? x set)
  (cond ((null? set) false)
	((equal? x (car set)) true)
	(else (element-of-set? x (cdr set)))))
;Value: element-of-set?

(define (adjoin-set x set)
  (cons x set))
;Value: adjoin-set
;Simplified

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
	(else (intersection-set (cdr set1) set2))))
;Value: intersection-set

(define (union-set set1 set2)
  (fold-right cons set2 set1))
;Value: union-set
;Simplified
