(define (make-account balance password)
  (let ((secondary-password #f))
    (define (withdraw amount)
      (if (>= balance amount)
	  (begin
	    (set! balance (- balance amount))
	    balance)
	  "Insufficient funds"))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (set-secondary-password another-password)
      (if secondary-password
	  "Already has a seconadry password"
	  (set! secondary-password another-password)))
    (define (dispatch input-password m)
      (if (if secondary-password
	      (or (eq? password input-password) (eq? secondary-password input-password))
	      (eq? password input-password))
	  (cond ((eq? m 'withdraw) withdraw)
		((eq? m 'deposit) deposit)
		((eq? m 'make-joint-account) set-secondary-password)
		(else (error "Unknown request: MAKE-ACCOUNT" m)))
	  (lambda (amount) "Incorrect password")))
    dispatch))
;Value: make-account

(define (make-joint acc main-password password)
  ((acc main-password 'make-joint-account) password)
  acc)
;Value: make-joint

(define peter-acc (make-account 100 'open-sesame))
;Value: peter-acc

(define paul-acc
  (make-joint peter-acc 'open-sesame 'rosebud))
;Value: paul-acc

((paul-acc 'rosebud 'withdraw) 10)
;Value: 90

((peter-acc 'open-sesame 'withdraw) 10)
;Value: 80