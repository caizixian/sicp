;The Miller-Rabin test described in SICP is different from other sources.

(define (square x)
  (* x x))

(define (even? n)
  (= (remainder n 2) 0))

;Check whether x is a nontrivial square root of 1 modulo n
;And then perform the square operation
;Signal 0 when discovers a nontrivial square root of 1 modulo n
(define (square-check x m)
  (if (and (not (or (= x 1) (= x (- m 1))))
           (= (remainder (square x) m) 1))
      0
      (remainder (square x) m)))

;Modified expmod to calculate base^exp%m
;Signal 0 when discovers a nontrivial square root of 1 modulo n
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (square-check (expmod base (/ exp 2) m) m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 2 (random (- n 2)))))

;Perform prime test for 8 times
(define (prime? n)
  (define (prime-iter n times)
    (cond ((= times 0) #t)
          ((miller-rabin-test n) (prime-iter n (- times 1)))
          (else #f)))
  (prime-iter n 8))