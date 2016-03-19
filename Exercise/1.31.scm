(define (product term a next b)
  (if (> a b)
      1
      (* (product term (next a) next b) (term a))))
;Value: product

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))
;Value: product-iter

(define (factorial n)
  (product (lambda (x) x) 1 (lambda (x) (+ 1 x)) n))
;Value: factorial

(define (factorial-iter n)
(define (product term a next b)
  (if (> a b)
      1
      (* (product term (next a) next b) (term a))))
;Value: product

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))
;Value: product-iter

(define (factorial n)
  (product (lambda (x) x) 1 (lambda (x) (+ 1 x)) n))
;Value: factorial

(define (factorial-iter n)
  (product-iter (lambda (x) x) 1 (lambda (x) (+ 1 x)) n))
;Value: factorial-iter

(factorial 5)
;Value: 120

(factorial-iter 5)
;Value: 120

(define (pi n)
  (* 4
     (product-iter
      (lambda (x)
        (if (= (remainder x 2) 1)
            (/ (+ 1 x) (+ 2 x))
            (/ (+ 2 x) (+ 1 x))))
      1
      (lambda (x) (+ 1 x))
      n)))
;Value: pi

(exact->inexact (pi 200))
;Value: 3.1493784731686008

(exact->inexact (pi 1000))
;Value: 3.1431607055322663

(exact->inexact (pi 100000))
;Value: 3.1416083612781764