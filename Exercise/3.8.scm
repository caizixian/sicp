(define (make-f)
  (let ((y 1))
    (lambda (x)
      (begin
	(set! y (* y x))
	y))))
;Value: make-f

(define f1 (make-f))
;Value: f1

(define f2 (make-f))
;Value: f2

(f1 0)
;Value: 0

(f1 1)
;Value: 0

(f2 1)
;Value: 1

(f2 0)
;Value: 0