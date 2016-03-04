(define (square x)
  (* x x))
;Value: square

(define (cubic x)
  (* x x x))
;Value: cubic

(define (improve guess x)
  (/ (+ (/ x (square guess))
	(* 2 guess))
     3))
;Value: improve

(improve 1.0 3)
;Value: 1.6666666666666667

(improve 1.6 3)
;Value: 1.4572916666666667

(improve 1.4 3)
;Value: 1.4435374149659863

(define (good-enough? guess x)
  (< (abs (- (/ (cubic guess) x) 1)) 0.0000001))
;Value: good-enough?

(define (cubic-root guess x)
  (if (good-enough? guess x)
      guess
      (cubic-root (improve guess x) x)))
;Value: cubic-root

(cubic-root 1.0 3.0)
;Value: 1.4422495703074416