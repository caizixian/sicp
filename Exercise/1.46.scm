(define (iterative-improvement good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  iter)
;Value: iterative-improvement

(define (average x y)
  (/ (+ x y) 2))
;Value: average

(define (square x)
  (* x x))
;Value: square

(define (sqrt x)
  ((iterative-improvement (lambda (guess)
                        (< (abs (- (square guess) x))
                           0.0001))
                          (lambda (guess)
                            (average guess (/ x guess))))
   1.0))
;Value: sqrt

(sqrt 3)
;Value: 1.7320508100147274

(define (fixed-point f first-guess)
  ((iterative-improvement (lambda (guess)
                            (< (abs (- (f guess) guess))
                               0.0001))
                          (lambda (guess)
                            (f guess))) first-guess))
;Value: fixed-point

(fixed-point cos 1.0)
;Value: .7391301765296711