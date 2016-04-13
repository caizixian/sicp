(define (equal? list1 list2)
  (cond ((and (null? list1) (null? list2)) #t)
	((or (null? list1) (null? list2)) #f)
	((and (symbol? list1) (symbol? list2)) (eq? list1 list2))
	((eq? (car list1) (car list2)) (equal? (cdr list1) (cdr list2)))
	(else #f)))
;Value: equal?

(equal? '(this is a list) '(this is a list))
;Value: #t

(equal? 'a 'b)
;Value: #f

(equal? '() '())
;Value: #t

(equal? '() 'a)
;Value: #f

(equal? 'a 'a)
;Value: #t

(equal? '(this is a list) '(this (is a) list))
;Value: #f