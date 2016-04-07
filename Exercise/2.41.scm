(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))
;Value: enumerate-interval

(define (append list1 list2)
  (fold-right cons list2 list1))
;Value: append

(define (flatmap proc seq)
  (fold-right append '() (map proc seq)))
;Value: flatmap

(define (ordered-triples n)
  (flatmap (lambda (i)
	     (flatmap (lambda (j)
			(map (lambda (k)
			       (list i j k))
			     (enumerate-interval 1 (- j 1))))
		      (enumerate-interval 1 (- i 1))))
	   (enumerate-interval 1 n)))
;Value: ordered-triples

(ordered-triples 4)
;Value 16: ((3 2 1) (4 2 1) (4 3 1) (4 3 2))

(define (sum-equal? s)
  (lambda (triple)
    (= (fold-right + 0 triple) s)))
;Value: sum-equal?

(define (search-triples n s)
  (filter (sum-equal? s) (ordered-triples n)))
;Value: search-triples

(search-triples 12 12)
;Value 20: ((5 4 3) (6 4 2) (6 5 1) (7 3 2) (7 4 1) (8 3 1) (9 2 1))