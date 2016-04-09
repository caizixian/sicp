(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame)
         (start-segment segment))
        ((frame-coord-map frame)
         (end-segment segment))))
     segment-list)))
;Value: segments->painter

(define outline-painter
  (segments->painter (list
		      (make-segment (make-vector 0.0 0.0)
				    (make-vector 0.0 1.0))
		      (make-segment (make-vector 1.0 0.0)
				    (make-vector 1.0 1.0))
		      (make-segment (make-vector 0.0 0.0)
				    (make-vector 1.0 0.0))
		      (make-segment (make-vector 0.0 1.0)
				    (make-vector 1.0 1.0)))))
(define x-painter
  (segments->painter (list
		      (make-segment (make-vector 0.0 0.0)
				    (make-vector 1.0 1.0))
		      (make-segment (make-vector 1.0 0.0)
				    (make-vector 0.0 1.0)))))

(define diamond-painter
  (segments->painter (list
		      (make-segment (make-vector 0.5 0.0)
				    (make-vector 1.0 0.5))
		      (make-segment (make-vector 1.0 0.5)
				    (make-vector 0.5 1.0))
		      (make-segment (make-vector 0.5 1.0)
				    (make-vector 0.0 0.5))
		      (make-segment (make-vector 0.0 0.5)
				    (make-vector 0.5 0.0)))))