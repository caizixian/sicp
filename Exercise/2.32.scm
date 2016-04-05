(define (subsets s)
   (if (null? s)
       (list '())
       (let ((rest (subsets (cdr s))))
          (append rest (map (lambda (x) (cons (car s) x))
                            rest)))))
;Value: subsets

(subsets '(1 2 3 4))
;Value 15: (() (4) (3) (3 4) (2) (2 4) (2 3) (2 3 4) (1) (1 4) (1 3) (1 3 4) (1 2) (1 2 4) (1 2 3) (1 2 3 4))

;0000 ()
;0001 (4)
;0010 (3)
;0011 (3 4)
;0100 (2)
;0101 (2 4)
;0110 (2 3)
;0111 (2 3 4)
;1000 (1)
;1001 (1 4)
;1010 (1 3)
;1011 (1 3 4)
;1100 (1 2)
;1101 (1 2 4)
;1110 (1 2 3)
;1111 (1 2 3 4)