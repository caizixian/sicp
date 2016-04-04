(define (deep-reverse tree)
  (if (pair? tree)
      (map deep-reverse (reverse tree))
      tree))
;Value: deep-reverse

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

(deep-reverse (list (list 1 2) (list 3 4)))
;Value 14: ((4 3) (2 1))

(deep-reverse (list 1 (list 2 (list 3 (list 4)))))
;Value 15: ((((4) 3) 2) 1)

(deep-reverse (list 1 (list 2 3) 4))
;Value 16: (4 (3 2) 1)

(deep-reverse (list 1))
;Value 17: (1)

(deep-reverse '())
;Value: ()