(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
;Value: accumulate

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))
;Value: map

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))
;Value: append

(append '(1 2 3) '(4 5 6))
;Value 16: (1 2 3 4 5 6)

(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))
;Value: length

(length '(1 2 3 4 5))
;Value: 5

