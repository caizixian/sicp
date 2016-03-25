(define zero (lambda (f) (lambda (x) x)))
;Value: zero

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
;Value: add-1

(define one (lambda (f) (lambda (x) (f x))))
;Value: one

(define two (lambda (f) (lambda (x) (f (f x)))))
;Value: two

(define (add m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))
;Value: add

(((add one two) 1+) 0)
;Value: 3

