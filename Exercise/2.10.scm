(define (make-interval a b) (cons a b))
;Value: make-interval

(define (upper-bound z)
  (if (> (car z) (cdr z))
      (car z)
      (cdr z)))
;Value: upper-bound

(define (lower-bound z)
  (if (< (car z) (cdr z))
      (car z)
      (cdr z)))
;Value: lower-bound

(define (sub-interval a b)
  (make-interval (- (lower-bound a) (upper-bound b))
		  (- (upper-bound a) (lower-bound b))))
;Value: sub-interval

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
;Value: add-interval

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
;Value: mul-interval

(define (contain-zero? x)
  (and (<= (lower-bound x) 0) (>= (upper-bound x) 0)))
;Value: contain-zero?

;(contain-zero? (make-interval -1 1))
;Value: #t

;(contain-zero? (make-interval 0 1))
;Value: #t

;(contain-zero? (make-interval 0.5 1))
;Value: #f

;(contain-zero? (make-interval -1 -0.5))
;Value: #f

(define (div-interval x y)
  (if (contain-zero? y)
      (error "Denom contains zero")
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
		      (/ 1.0 (lower-bound y))))))
;Value: div-interval

(div-interval (make-interval 2 5) (make-interval -2 2))
;Denom contains zero


