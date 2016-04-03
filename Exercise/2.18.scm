(define (extend list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (extend (cdr list1) list2))))
;Value: extend

(define (reverse sequence)
  (if (null? sequence)
      sequence
      (extend (reverse (cdr sequence)) (list (car sequence)))))
;Value: reverse

(reverse '())
;Value: ()

(reverse (list 1))
;Value 20: (1)

(reverse (list 1 4 9 16 25))
;Value 22: (25 16 9 4 1)

(define (reverse-iter sequence)
  (define (iter list1 list2)
    (if (null? list1)
	list2
	(iter (cdr list1) (cons (car list1) list2))))
  (if (null? sequence)
      '()
      (iter (cdr sequence) (list (car sequence)))))
;Value: reverse-iter

(reverse-iter '())
;Value: ()

(reverse-iter (list 1))
;Value 23: (1)

(reverse-iter (list 1 4 9 16 25))
;Value 24: (25 16 9 4 1)