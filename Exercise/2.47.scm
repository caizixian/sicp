(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))
;Value: make-frame

(define (origin-frame frame)
  (car frame))
;Value: origin-frame

(define (edge1-frame frame)
  (cadr frame))
;Value: edge1-frame

(define (edge2-frame frame)
  (cadr (cdr frame)))
;Value: edge2-frame

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
;Value: make-frame

(define (origin-frame frame)
  (car frame))
;Value: origin-frame

(define (edge1-frame frame)
  (car (cdr frame)))
;Value: edge1-frame

(define (edge2-frame frame)
  (cdr (cdr frame)))
;Value: edge2-frame