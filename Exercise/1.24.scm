(define (square x)
  (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (next-odd n)
  (if (= (remainder n 2) 0)
      (+ 1 n)
      (+ 2 n)))

(define (prime? n)
  (define (fast-prime? n times)
    (cond ((= times 0) #t)
          ((fermat-test n) (fast-prime? n (- times 1)))
          (else #f)))
  (fast-prime? n 8))

(define (find-primes baseline count)
  (cond ((= count 0) 'done)
        ((prime? baseline) (begin (display baseline) (newline) (find-primes (next-odd baseline) (- count 1))))
        (else (find-primes (next-odd baseline) count))))

(define (timed-find-primes baseline count)
  (let ((start-time (real-time-clock)))
       (find-primes baseline count)
       (- (real-time-clock) start-time)))