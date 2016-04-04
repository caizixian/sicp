(define x (list 1 2 3))
;Value: x

(define y (list 4 5 6))
;Value: y

(append x y)
;Value 13: (1 2 3 4 5 6)

(cons x y)
;Value 14: ((1 2 3) 4 5 6)

(list x y)
;Value 15: ((1 2 3) (4 5 6))