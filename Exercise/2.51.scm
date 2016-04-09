(define (below down up)
  (let ((split-point (make-vector (0.0 0.5))))
    (let ((paint-down
	   (tranform-painter
	    down
	    (make-vector 0.0 0.0)
	    (make-vector 1.0 0.0)
	    split-point))
	  (paint-up
	   (tranform-painter
	    up
	    split-point
	    (make-vector 1.0 0.5)
	    (make-vector 0.0 1.0))))
      (lambda (frame)
	(paint-down frame)
	(paint-up frame)))))
;Value: below

(define (rotate-90 painter)
 (transform-painter painter
		    (make-vector 1.0 0.0)
		    (make-vector 1.0 1.0)
		    (make-vector 0.0 0.0)))
;Value: rotate-90

(define (below down up)
  (rotate-90 (beside (rotate-270 down) (rotate-270 up))))
;Value: below