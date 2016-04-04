(define (square x)
  (* x x))
;Value: square

(define (square-list items)
  (if (null? items)
      '()
      (cons (square (car items)) (square-list (cdr items)))))
;Value: square-list


(square-list (list 1 2 3 4))
;Value 14: (1 4 9 16)

(define (square-list-map items)
  (map square items))
;Value: square-list-map

(square-list-map (list 1 2 3 4))
;Value 15: (1 4 9 16)