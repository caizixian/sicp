(define (average x y)
    (/ (+ x y) 2))
;Value: average

(define (improve guess x)
    (average guess (/ x guess)))
;Value: improve

(define (good-enough1? guess x)
    (< (abs (- (square guess) x))
        0.001))
;Value: good-enough1?

(define (try1 guess x)
    (if (good-enough1? guess x) guess
        (try1 (improve guess x)x)))
;Value: try1

(try1 1.0 1.1)
;Value: 1.0488095238095239

(define (good-enough2? guess x)
  (< (abs (- (/ (square guess) x) 1)) 0.0000001))
;Value: good-enough2?

(good-enough2? 1.732050808 3)
;Value: #t

(good-enough2? 1.7305 3)
;Value: #f

(define (try2 guess x)
  (if (good-enough2? guess x)
      guess
      (try2 (improve guess x) x)))
;Value: try2

(try2 1.0 1.1)
;Value: 1.0488088481703692
