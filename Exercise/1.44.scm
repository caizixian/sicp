(define (average a b c)
  (/ (+ a b c) 3))
;Value: average

(define (compose f g)
  (lambda (x) (f (g x))))
;Value: compose

(define (repeated f count)
  (if (= count 0)
      f
      (compose f f)))
;Value: repeated

(define (smooth f)
  (let ((dx 1))
    (lambda (x)
      (average (f x) (f (+ x dx)) (f (- x dx))))))
;Value: smooth

(define (nth-smooth f n)
  ((repeated smooth n) f))
;Value: nth-smooth
