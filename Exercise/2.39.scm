(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))
;Value: reverse

(reverse '(1 2 3))
;Value 14: (3 2 1)

(reverse '())
;Value: ()

(reverse '(1))
;Value 15: (1)

(define (append seq1 seq2)
  (fold-right cons seq2 seq1))
;Value: append

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) '() sequence))
;Value: reverse

(reverse '(1 2 3))
;Value 16: (3 2 1)