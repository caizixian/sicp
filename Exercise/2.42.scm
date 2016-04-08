(define (append list1 list2)
  (fold-right cons list2 list1))
;Value: append

(define (flatmap proc seq)
  (fold-right append '() (map proc seq)))
;Value: flatmap

(define empty-board '())
;Value: empty-board

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))
;Value: enumerate-interval

(define (adjoin-position row column rest-of-queens)
  (append (list (cons row column)) rest-of-queens))
;Value: adjoin-position

(define (safe? column positions)
  (define (iter new-queen old-queen)
    (if (null? old-queen)
	#t
	(let ((check-queen (car old-queen)))
	  (if (and (not (= (car check-queen) (car new-queen)))
		   (not (= (abs (- (car check-queen) (car new-queen)))
			   (abs (- (cdr check-queen) (cdr new-queen))))))
	      (iter new-queen (cdr old-queen))
	      #f))))
  (iter (car positions) (cdr positions)))
;Value: safe?

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions) (safe? k positions))
	 (flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
                   (adjoin-position
                    new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))
;Value: queens

(length (queens 8))
;Value: 92


