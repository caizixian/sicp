(define (add a b)
  (if (= a 0) b (1+ (add (-1+ a) b))))
;Value: add

(add 4 5)
;Value: 9

;recursive process
;(add 4 5)
;(1+ (add 3 5))
;(1+ (1+ (add 2 5)))
;(1+ (1+ (1+ (add 1 5))))
;(1+ (1+ (1+ (1+ (add 0 5)))))
;(1+ (1+ (1+ (1+ 5))))
;(1+ (1+ (1+ 6)))
;(1+ (1+ 7))
;(1+ 8)
;9




(define (add a b)
  (if (= a 0) b (add (-1+ a) (1+ b))))
;Value: add

(add 4 5)
;Value: 9

;iterative process
;(add 4 5)
;(add 3 6)
;(add 2 7)
;(add 1 8)
;(add 0 9)
;9