(define (append list1 list2)
  (fold-right cons list2 list1))
;Value: append

(define (flatmap proc seq)
  (fold-right append '() (map proc seq)))
;Value: flatmap

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))
;Value: enumerate-interval

(define (unique-pairs n)
  (flatmap 
   (lambda (i)
     (map (lambda (j) (list i j))
          (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))
;Value: unique-pairs

(unique-pairs 6)
;Value 15: ((2 1) (3 1) (3 2) (4 1) (4 2) (4 3) (5 1) (5 2) (5 3) (5 4) (6 1) (6 2) (6 3) (6 4) (6 5))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))
;Value: prime-sum-pairs