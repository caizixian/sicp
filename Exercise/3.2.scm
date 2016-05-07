(define (make-monitored f)
  (let ((counter 0))
    (define (dispatch args)
      (cond ((eq? args 'how-many-calls?) counter)
	    ((eq? args 'reset-count) (set! counter 0))
	    (else
	     (begin
	       (set! counter (+ counter 1))
	       (f args)))))
    dispatch))
;Value: make-monitored

(define s (make-monitored sqrt))
;Value: s

(s 100)
;Value: 10

(s 400)
;Value: 20

(s 'how-many-calls?)
;Value: 2

(s 'reset-count)
;Value: 2

(s 'how-many-calls?)
;Value: 0