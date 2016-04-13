(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp) (if (same-variable? exp var) 1 0))
	((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
	((exponentiation? exp)
	 (make-product (exponent exp)
		       (make-product (make-exponentiation (base exp) (- (exponent exp) 1))
				     (deriv (base exp) var))))
	(else
	 (error "unknown expression type: DERIV" exp))))
;Value: deriv

(define (=number? exp num) (and (number? exp) (= exp num)))
;Value: =number?

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2) ((=number? a2 0) a1)
	((and (number? a1) (number? a2)) (+ a1 a2))
	(else (list '+ a1 a2))))
;Value: make-sum

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	((=number? m1 1) m2)
	((=number? m2 1) m1)
	((and (number? m1) (number? m2)) (* m1 m2))
	(else (list '* m1 m2))))
;Value: make-product

(define (variable? x) (symbol? x))
;Value: variable?

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
;Value: same-variable?

(define (sum? x) (and (pair? x) (eq? (car x) '+)))
;Value: sum?

(define (addend s) (cadr s))
;Value: addend

(define (augend s) (caddr s))
;Value: augend

(define (product? x) (and (pair? x) (eq? (car x) '*)))
;Value: product?

(define (multiplier p) (cadr p))
;Value: multiplier

(define (multiplicand p) (caddr p))
;Value: multiplicand

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))
;Value: exponentiation?

(define (base e)
  (cadr e))
;Value: base

(define (exponent e)
  (caddr e))
;Value: exponent

(define (make-exponentiation base exp)
  (cond ((=number? base 0) 0)
	((=number? exp 0) 1)
	((=number? base 1) 1)
	((=number? exp 1) base)
	(else (list '** base exp))))
;Value: make-exponentiation

(deriv '(+ (* a (** x 2))
	   (+ (* b x)
	      c)) 'x)
;Value 16: (+ (* a (* 2 x)) b)

