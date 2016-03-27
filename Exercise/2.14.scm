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
   (let ((xlo (lower-bound x))
         (xhi (upper-bound x))
         (ylo (lower-bound y))
         (yhi (upper-bound y)))
   (cond ((and (>= xlo 0)
               (>= xhi 0)
               (>= ylo 0)
               (>= yhi 0))
          ; [+, +] * [+, +]
          (make-interval (* xlo ylo) (* xhi yhi)))
         ((and (>= xlo 0)
               (>= xhi 0)
               (<= ylo 0)
               (>= yhi 0))
          ; [+, +] * [-, +]
          (make-interval (* xhi ylo) (* xhi yhi)))
         ((and (>= xlo 0)
               (>= xhi 0)
               (<= ylo 0)
               (<= yhi 0))
          ; [+, +] * [-, -]
          (make-interval (* xhi ylo) (* xlo yhi)))
         ((and (<= xlo 0)
               (>= xhi 0)
               (>= ylo 0)
               (>= yhi 0))
          ; [-, +] * [+, +]
          (make-interval (* xlo yhi) (* xhi yhi)))
         ((and (<= xlo 0)
               (>= xhi 0)
               (<= ylo 0)
               (>= yhi 0))
          ; [-, +] * [-, +]
          (make-interval (min (* xhi ylo) (* xlo yhi))
                         (max (* xlo ylo) (* xhi yhi))))
         ((and (<= xlo 0)
               (>= xhi 0)
               (<= ylo 0)
               (<= yhi 0))
          ; [-, +] * [-, -]
          (make-interval (* xhi ylo) (* xlo ylo)))
         ((and (<= xlo 0)
               (<= xhi 0)
               (>= ylo 0)
               (>= yhi 0))
          ; [-, -] * [+, +]
          (make-interval (* xlo yhi) (* xhi ylo)))
         ((and (<= xlo 0)
               (<= xhi 0)
               (<= ylo 0)
               (>= yhi 0))
          ; [-, -] * [-, +]
          (make-interval (* xlo yhi) (* xlo ylo)))
         ((and (<= xlo 0)
               (<= xhi 0)
               (<= ylo 0)
               (<= yhi 0))
          ; [-, -] * [-, -]
          (make-interval (* xhi yhi) (* xlo ylo))))))
;Value: mul-interval

(define (contain-zero? x)
  (and (<= (lower-bound x) 0) (>= (upper-bound x) 0)))
;Value: contain-zero?

(define (div-interval x y)
  (if (contain-zero? y)
      (error "Denom contains zero")
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
		      (/ 1.0 (lower-bound y))))))
;Value: div-interval

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
;Value: make-center-width

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
;Value: center

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))
;Value: width

(make-center-width 2 2)
;Value 14: (0 . 4)

(define (make-center-percent center percentage)
  (make-center-width center (* center (/ percentage 100))))
;Value: make-center-percent

(define (percent x)
  (* 100 (/ (- (upper-bound x) (center x)) (center x))))
;Value: percent

;The approximate percentage tolerance of the product of the two intervals is the sum of the tolerances of the two factors.

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
;Value: par1

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one (add-interval (div-interval one r1)
                       (div-interval one r2)))))
;Value: par2

(define res1 (make-center-percent 10 5))
;Value: res1

(define res2 (make-center-percent 5 5))
;Value: res2

(define result1 (par1 res1 res2))
;Value: result1

(define result2 (par2 res1 res2))
;Value: result2

result1
;Value 13: (2.865079365079365 . 3.8684210526315788)

result2
;Value 14: (3.166666666666667 . 3.5)

(center result1)
;Value: 3.366750208855472
(center result2)
;Value: 3.3333333333333335

(percent result1)
;Value: 14.900744416873438

(percent result2)
;Value: 4.999999999999996

(define aa (div-interval res1 res1))
;Value: aa

aa
;Value 16: (.9047619047619047 . 1.1052631578947367)

(center aa)
;Value: 1.0050125313283207

(percent aa)
;Value: 9.975062344139651

(define ab (div-interval res1 res2))
;Value: ab

ab
;Value 17: (1.8095238095238093 . 2.2105263157894735)

(center ab)
;Value: 2.0100250626566414

(percent ab)
;Value: 9.975062344139651