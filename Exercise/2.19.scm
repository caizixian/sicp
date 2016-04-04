(define (cc amount coin-values)
  (cond ((= amount 0) 1)
	((or (< amount 0) (no-more? coin-values)) 0)
	(else
         (+ (cc amount
                (except-first-denomination
                 coin-values))
            (cc (- amount
                   (first-denomination
                    coin-values))
                coin-values)))))
;Value: cc

(define (first-denomination sequence)
  (car sequence))
;Value: first-denomination

(define (except-first-denomination sequence)
  (cdr sequence))
;Value: except-first-denomination

(define (no-more? sequence)
  (null? sequence))
;Value: no-more?

(define us-coins (list 50 25 10 5 1))
;Value: us-coins

(cc 100 us-coins)
;Value: 292

(define us-coins-reverse (list 1 5 10 25 50))
;Value: us-coins-reverse

(cc 100 us-coins-reverse)
;Value: 292