(define (entry tree)
  (car tree))
;Value: entry

(define (left-branch tree)
  (cadr tree))
;Value: left-branch

(define (right-branch tree)
  (caddr tree))
;Value: right-branch

(define (make-record key content)
  (cons key content))
;Value: make-record

(define (key record)
  (car record))
;Value: key

(define (content record)
  (cdr record))
;Value: content

(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) #f)
        ((= given-key (key (entry set-of-records))) (entry set-of-records))
        ((< given-key (key (entry set-of-records)))
         (lookup given-key (left-branch set-of-records)))
        ((> given-key (key (entry set-of-records)))
         (lookup given-key (right-branch set-of-records)))))
;Value: lookup

(define database '((2 . Joe) ((1 . Bill) () ()) ((3 . Frank) () ((4 . John) () ()))))
;Value: database

(lookup 3 database)
;Value 15: (3 . frank)

(lookup 5 database)
;Value: #f

(content (lookup 3 database))
;Value: frank