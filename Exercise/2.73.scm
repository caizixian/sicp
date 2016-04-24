(define (operator exp) (car exp))
;Value: operator

(define (operands exp) (cdr exp))
;Value: operands

(define (variable? x) (symbol? x))
;Value: variable?

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
;Value: same-variable?

(define (=number? exp num) (and (number? exp) (= exp num)))
;Value: =number?

(define get 2d-get)
;Value: get

(define put 2d-put!)
;Value: put

(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp) (if (same-variable? exp var) 1 0))
	(else ((get 'deriv (operator exp))
	       (operands exp) var))))
;Value: deriv

(define (install-sum-package)

  (define (addend s) (car s))
  
  (define (augend s) (cadr s))
  
  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2) ((=number? a2 0) a1)
	  ((and (number? a1) (number? a2)) (+ a1 a2))
	  (else (list '+ a1 a2))))
  
  (define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var)
	      (deriv (augend exp) var)))

  (put 'deriv '+ deriv-sum)
  
  (put 'make '+ make-sum))
;Value: install-sum-package

(install-sum-package)

(define (install-mul-package)
  
  (define (multiplier p) (car p))

  (define (multiplicand p) (cadr p))

  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	  ((=number? m1 1) m2)
	  ((=number? m2 1) m1)
	  ((and (number? m1) (number? m2)) (* m1 m2))
	  (else (list '* m1 m2))))
  
  (define (deriv-mul exp var)
    ((get 'make '+)
     (make-product (multiplier exp)
		   (deriv (multiplicand exp) var))
     (make-product (deriv (multiplier exp) var)
		   (multiplicand exp))))

  (put 'make '* make-product)
  
  (put 'deriv '* deriv-mul))
;Value: install-mul-package

(install-mul-package)

(define (install-exp-package)

  (define (base e) (car e))

  (define (exponent e) (cadr e))

  (define (make-exponentiation base exp)
    (cond ((=number? base 0) 0)
          ((=number? exp 0) 1)
          ((=number? base 1) 1)
          ((=number? exp 1) base)
          (else (list '** base exp))))

  (define (deriv-exp exp var)
    ((get 'make '*) (exponent exp)
                    ((get 'make '*)
                     (make-exponentiation (base exp) (- (exponent exp) 1))
                     (deriv (base exp) var))))

  (put 'make '** make-exponentiation)

  (put 'deriv '** deriv-exp))
;Value: install-exp-package

(install-exp-package)

(deriv '(+ (* a (** x 2))
	   (+ (* b x)
	      c)) 'x)
;Value 16: (+ (* a (* 2 x)) b)

;modify puts