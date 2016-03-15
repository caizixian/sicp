(define (square x)
  (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (prime? n)
  (= n (find-divisor n 2)))

(define (next divisor)
  (if (= divisor 2) 3 (+ divisor 2)))

(define (next-odd n)
  (if (= (remainder n 2) 0)
      (+ 1 n)
      (+ 2 n)))

(define (find-primes baseline count)
  (cond ((= count 0) 'done)
        ((prime? baseline) (begin (display baseline) (newline) (find-primes (next-odd baseline) (- count 1))))
        (else (find-primes (next-odd baseline) count))))

(define (timed-find-primes baseline count)
  (let ((start-time (real-time-clock)))
       (find-primes baseline count)
       (- (real-time-clock) start-time)))