(define (make-account balance password)
  (let ((wrong-password-count 0))
    (define (withdraw amount)
      (if (>= balance amount)
	  (begin
            (set! balance (- balance amount))
	    balance)
	  "Insufficient funds"))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (should-call-cop?)
      (if (>= wrong-password-count 7)
	  (display "call-the-cops")
	  #f))
    (define (reset-count)
      (set! wrong-password-count 0))
    (define (+wrong-password-count)
      (set! wrong-password-count (+ 1 wrong-password-count)))
    (define (dispatch input-password m)
      (if (eq? password input-password)
	  (begin
	    (reset-count)
	    (cond ((eq? m 'withdraw) withdraw)
		  ((eq? m 'deposit) deposit)
		  (else (error "Unknown request: MAKE-ACCOUNT" m))))
	  (begin
	    (+wrong-password-count)
	    (should-call-cop?)
	    (lambda (amount) "Incorrect password"))))
    dispatch))
;Value: make-account

(define acc (make-account 100 'secret-password))
;Value: acc

((acc 'some-other-password 'deposit) 50)
;Value 14: "Incorrect password"

((acc 'some-other-password 'deposit) 50)
;Value 14: "Incorrect password"

((acc 'some-other-password 'deposit) 50)
;Value 14: "Incorrect password"

((acc 'some-other-password 'deposit) 50)
;Value 14: "Incorrect password"

((acc 'some-other-password 'deposit) 50)
;Value 14: "Incorrect password"

((acc 'some-other-password 'deposit) 50)
;Value 14: "Incorrect password"

((acc 'some-other-password 'deposit) 50)
call-the-cops
;Value 14: "Incorrect password"

((acc 'secret-password 'withdraw) 40)
;Value: 60

((acc 'some-other-password 'deposit) 50)
;Value 14: "Incorrect password"