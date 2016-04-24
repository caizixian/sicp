(define (get-record division name)
  ((get division 'record) name))

(define (get-salary division record)
  ((get division 'salary) record))

(define (find-employee-record divisions name)
  (if (null? divisions)
      '()
      (cons
       (get-record (car divisions) name)
       (find-employee-record (cdr divisons) name))))

;when taking over a new company, just install the corresponding package which contains methods to be registered
