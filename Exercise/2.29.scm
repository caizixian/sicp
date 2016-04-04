(define (make-mobile left right)
  (list left right))
;Value: make-mobile

(define (make-branch length structure)
  (list length structure))
;Value: make-branch

(define (left-branch mobile)
  (car mobile))
;Value: left-branch


(define (right-branch mobile)
  (cadr mobile))
;Value: right-branch

;Modification (cdr mobile)

(define (branch-length branch)
  (car branch))
;Value: branch-length

(define (branch-structure branch)
  (cadr branch))
;Value: branch-structure

;Modification (cdr branch)

(define (mobile-branch? branch)
  (pair? (branch-structure branch)))
;Value: mobile-branch?

(define (branch-weight branch)
  (if (mobile-branch? branch)
      (total-weight (branch-structure branch))
      (branch-structure branch)))
;Value: branch-weight

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile))))
;Value: total-weight

(define mobile1 (make-mobile (make-branch 1 2) (make-branch 3 4)))
;Value: mobile1

(total-weight mobile1)
;Value: 6

(define mobile2 (make-mobile (make-branch 2 1) (make-branch 3 mobile1)))
;Value: mobile2

(total-weight mobile2)
;Value: 7

(define (branch-torque branch)
  (* (branch-weight branch) (branch-length branch)))
;Value: branch-torque

(define (mobile-balanced? mobile)
  (and (= (branch-torque (left-branch mobile)) (branch-torque (right-branch mobile)))
       (branch-balanced? (left-branch mobile))
       (branch-balanced? (right-branch mobile))))
;Value: mobile-balanced?

(define (branch-balanced? branch)
  (if (mobile-branch? branch)
      (mobile-balanced? (branch-structure branch))
      #t))
;Value: branch-balanced?

(define mobile3 (make-mobile
		 (make-branch 2 3)
		 (make-branch 2 
			      (make-mobile
			       (make-branch 1 2)
			       (make-branch 2 1)))))
;Value: mobile3

(mobile-balanced? mobile3)
;Value: #t

(mobile-balanced? mobile1)
;Value: #f

(define mobile4 (make-mobile
		 (make-branch 4 5)
		 (make-branch 5 4)))
;Value: mobile4

(mobile-balanced? mobile4)
;Value: #t
