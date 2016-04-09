(define (make-segment vec1 vec2)
  (cons vec1 vec2))
;Value: make-segment

(define (start-segment seg)
  (car seg))
;Value: start-segment

(define (end-segment seg)
  (cdr seg))
;Value: end-segment