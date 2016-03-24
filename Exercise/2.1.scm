(define (make-rat numer denom)
  (define (make n d)
    (let ((g (gcd n d)))
      (cons (/ n g) (/ d g))))
  (if (< (* numer denom) 0)
      (if (< numer 0)
	  (make numer denom)
	  (make (- numer) (- denom)))
      (make numer denom)))
;Value: make-rat

(define (numer x)
  (car x))
;Value: numer

(define (denom x)
  (cdr x))
;Value: denom

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))
;Value: print-rat

(print-rat (make-rat -1 2))

;-1/2
;Unspecified return value

(print-rat (make-rat 1 2))

;1/2
;Unspecified return value

(print-rat (make-rat 1 -2))

;-1/2
;Unspecified return value

