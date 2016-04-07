(fold-right / 1 (list 1 2 3))
;Value: 3/2

(fold-left / 1 (list 1 2 3))
;Value: 1/6

(fold-right list '() (list 1 2 3))
;Value 13: (1 (2 (3 ())))

(fold-left list '() (list 1 2 3))
;Value 14: (((() 1) 2) 3)

;property (op a b) = (op b a)