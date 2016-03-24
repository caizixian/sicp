(define (make-point x y)
  (cons x y))
;Value: make-point

(define (x-point point)
  (car point))
;Value: x-point

(define (y-point point)
  (cdr point))
;Value: y-point

(define (x-delta pt1 pt2)
  (abs (- (x-point pt2) (x-point pt1))))
;Value: x-delta

(define (y-delta pt1 pt2)
  (abs (- (y-point pt2) (y-point pt1))))
;Value: y-delta

(define (make-rectangle-1 width height)
  (cons width height))
;Value: make-rectangle-1

(define (rectangle-width-1 rect)
  (car rect))
;Value: rectangle-width-1

(define (rectangle-height-1 rect)
  (cdr rect))
;Value: rectangle-height-1

(define (rectangle-area-1 rect)
  (* (rectangle-width-1 rect) (rectangle-height-1 rect)))
;Value: rectangle-area-1

(define (rectangle-perimeter-1 rect)
  (* 2 (+ (rectangle-width-1 rect)
	  (rectangle-height-1 rect))))
;Value: rectangle-perimeter-1

(define rect-1 (make-rectangle-1 3 4))
;Value: rect-1

(rectangle-area-1 rect-1)
;Value: 12

(rectangle-perimeter-1 rect-1)
;Value: 14

(define (make-rectangle-2 pt1 pt2)
  (cons pt1 pt2))
;Value: make-rectangle-2

(define (rectangle-width-2 rect)
  (x-delta (car rect) (cdr rect)))
;Value: rectangle-width-2

(define (rectangle-height-2 rect)
  (y-delta (car rect) (cdr rect)))
;Value: rectangle-height-2

(define (rectangle-area-2 rect)
  (* (rectangle-width-2 rect) (rectangle-height-2 rect)))
;Value: rectangle-area-2

(define (rectangle-perimeter-2 rect)
  (* 2 (+ (rectangle-width-2 rect)
          (rectangle-height-2 rect))))
;Value: rectangle-perimeter-2

(define rect-2 (make-rectangle-2 (make-point 1 2) (make-point 3 4)))
;Value: rect-2

(rectangle-area-2 rect-2)
;Value: 4

(rectangle-perimeter-2 rect-2)
;Value: 8

