(define (memq item x) ;returns the sublist of the list beginning with the first occurrence of the symbol
  (cond ((null? x) #f)
	((eq? item (car x)) x)
	(else (memq item (cdr x)))))
;Value: memq

(list 'a 'b 'c)
;Value 16: (a b c)

'(a b c)
;Value 17: (a b c)

(list (list 'george))
;Value 18: ((george))

'((george))
;Value 19: ((george))

(cdr '((x1 x2) (y1 y2)))
;Value 20: ((y1 y2))

(cadr '((x1 x2) (y1 y2)))
;Value 21: (y1 y2)

(pair? (car '(a short list)))
;Value: #f

(symbol? (car '(a short list)))
;Value: #t

(memq 'red '((red shoes) (blue socks)))
;Value: #f

(memq 'red '(red shoes blue socks))
;Value 22: (red shoes blue socks)