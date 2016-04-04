(define (same-parity . params)
  (define check-parity?
    (lambda (num)
      (= (remainder num 2) (remainder (car params) 2))))
  (filter check-parity? params))
;Value: same-parity

(same-parity 1 2 3 4 5 6 7)
;Value 15: (1 3 5 7)

(same-parity 2 3 4 5 6 7)
;Value 16: (2 4 6)