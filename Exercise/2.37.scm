(define (dot-product v w)
  (fold-right + 0 (map * v w)))
;Value: dot-product

(dot-product '(1 2 3 4) '(4 3 2 1))
;Value: 20

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))
;Value: matrix-*-vector

(define matrix1 (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
;Value: matrix1

(define vector1 (list 2 2 3))
;Value: vector1

(matrix-*-vector matrix1 vector1)
;Value 15: (15 36 57)

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (fold-right op init (map car seqs))
	        (accumulate-n op init (map cdr seqs)))))
;Value: accumulate-n

(define (transpose mat)
  (accumulate-n cons '() mat))
;Value: transpose

(transpose matrix1)
;Value 16: ((1 4 7) (2 5 8) (3 6 9))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))
;Value: matrix-*-matrix

(matrix-*-matrix matrix1 matrix1)
;Value 17: ((30 36 42) (66 81 96) (102 126 150))

