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