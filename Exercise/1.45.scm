(define (fixed-point f first-guess)
  (let ((tolerance 0.00001))
    (define (close-enough? v1 v2)
      (< (abs (- v1 v2))
      tolerance))
    (define (try guess)
      (let ((next (f guess)))
    (if (close-enough? guess next)
            next
            (try next))))
    (try first-guess)))
;Value: fixed-point

(define (compose f g)
  (lambda (x) (f (g x))))
;Value: compose

(define (repeated f count)
  (if (= count 0)
      f
      (compose f f)))
;Value: repeated

(define (average-damp f)
  (lambda (x) (average x (f x))))
;Value: average-damp

(define (average x y)
  (/ (+ x y) 2))
;Value: average

(define (nth-root x n)
  (fixed-point
      ((repeated average-damp (floor (log2 n)))
          (lambda (y) (/ x (expt y (- n 1)))))
      1.0))
;Value: nth-root

(define (log2 x)
  (/ (log x) (log 2)))
;Value: log2

(nth-root 4294967296 32)
;Value: 2.000005544883138