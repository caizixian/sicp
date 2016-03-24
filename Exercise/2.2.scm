(define (make-point x y)
  (cons x y))
;Value: make-point

(define (x-point point)
  (car point))
;Value: x-point

(define (y-point point)
  (cdr point))
;Value: y-point

(define (make-segment start end)
  (cons start end))
;Value: make-segment

(define (start-segment segment)
  (car segment))
;Value: start-segment

(define (end-segment segment)
  (cdr segment))
;Value: end-segment

(define (average x y)
  (/ (+ x y) 2))
;Value: average

(define (midpoint-segment segment)
  (make-point (average (x-point (start-segment segment)) (x-point (end-segment segment)))
	      (average (y-point (start-segment segment)) (y-point (end-segment segment)))))
;Value: midpoint-segment

(define my-segment (make-segment (make-point -2 3) (make-point 4 5)))
;Value: my-segment

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))
;Value: print-point

(print-point (midpoint-segment my-segment))

;(1, 4)
;Unspecified return value

