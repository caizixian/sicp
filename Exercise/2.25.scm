(define list1 (list 1 3 (list 5 7) 9))
;Value: list1

list1
;Value 13: (1 3 (5 7) 9)

(cadr (cadr (cdr list1)))
;Value: 7

(define list2 (list (list 7)))
;Value: list2

list2
;Value 15: ((7))

(car (car list2))
;Value: 7

(define list3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
;Value: list3

list3
;Value 17: (1 (2 (3 (4 (5 (6 7))))))

(cadr (cadr (cadr (cadr (cadr (cadr list3))))))
;Value: 7