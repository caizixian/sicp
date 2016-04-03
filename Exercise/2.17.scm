(define (last-pair sequence)
  (if (null? (cdr sequence))
      sequence
      (last-pair (cdr sequence))))
;Value: last-pair

(last-pair (list 1))
;Value 16: (1)

(last-pair (list 23 72 149 34))
;Value 17: (34)
