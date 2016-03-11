(define (even? n)
  (= (remainder n 2) 0))
;Value: even?

(define (fast-mul a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-mul (* a 2) (/ b 2)))
        (else (+ a (fast-mul a (- b 1))))))
;Value: fast-mul

(fast-mul 2 1)
;Value: 2

(fast-mul 2 2)
;Value: 4

(fast-mul 2 3)
;Value: 6

(fast-mul 3 9)
;Value: 27

