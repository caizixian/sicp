(define (pascal row column)
  (if (or (= column 1) (= column row)) 1
      (+ (pascal (- row 1) (- column 1))
	 (pascal (- row 1) column))))
;Value: pascal

(pascal 1 1)
;Value: 1

(pascal 2 1)
;Value: 1

(pascal 2 2)
;Value: 1

(pascal 3 1)
;Value: 1

(pascal 3 2)
;Value: 2

(pascal 3 3)
;Value: 1

(pascal 4 1)
;Value: 1

(pascal 4 2)
;Value: 3

(pascal 4 3)
;Value: 3

(pascal 4 4)
;Value: 1

