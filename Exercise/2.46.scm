(define (make-vector xcor ycor)
  (cons xcor ycor))
;Value: make-vector

(define (xcor-vector vec)
  (car vec))
;Value: xcor-vector

(define (ycor-vector vec)
  (cdr vec))
;Value: ycor-vector

(define (add-vector vec1 vec2)
  (make-vector (+ (xcor-vector vec1)
		  (xcor-vector vec2))
	       (+ (ycor-vector vec1)
		  (ycor-vector vec2))))
;Value: add-vector

(define (sub-vector vec1 vec2)
  (make-vector (- (xcor-vector vec1)
                  (xcor-vector vec2))
               (- (ycor-vector vec1)
                  (ycor-vector vec2))))
;Value: sub-vector

(define (scale-vector scale vec)
  (make-vector (* scale (xcor-vect vec)) (* scale (ycor-vect vec))))
;Value: scale-vector