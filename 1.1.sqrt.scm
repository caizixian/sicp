(define (average x y)
    (/ (+ x y) 2))

(define (improve guess x)
    (average guess (/ x guess)))

(define (good-enough? guess x)
    (< (abs (- (square guess) x))
        0.001))

(define (try guess x)
    (if (good-enough? guess x) guess
        (try (improve guess x)x)))

(try 1 16)