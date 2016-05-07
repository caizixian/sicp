(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
	(begin
	    (set! balance (- balance amount))
	      balance)
	"Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch input-password m)
    (if (eq? password input-password)
	(cond ((eq? m 'withdraw) withdraw)
	            ((eq? m 'deposit) deposit)
		          (else (error "Unknown request: MAKE-ACCOUNT" m)))
	(lambda (amount) "Incorrect password")))
  dispatch)
;Value: make-account

(define acc (make-account 100 'secret-password))
;Value: acc

((acc 'secret-password 'withdraw) 40)
;Value: 60

((acc 'some-other-password 'deposit) 50)
;Value 14: "Incorrect password"