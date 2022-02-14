(define (over-or-under num1 num2)
  'YOUR-CODE-HERE
  (cond ((= num1 num2) 0)
        ((> num1 num2) 1)
        (-1))
)

;;; Tests
(over-or-under 1 2)
; expect -1
(over-or-under 2 1)
; expect 1
(over-or-under 1 1)
; expect 0


(define (filter-lst fn lst)
  'YOUR-CODE-HERE
  (cond ((null? lst) '())
        ((fn (car lst))
         (cons (car lst) (filter-lst fn (cdr lst))))
        (else (filter-lst fn (cdr lst))))
)

;;; Tests
(define (even? x)
  (= (modulo x 2) 0))
(filter-lst even? '(0 1 1 2 3 5 8))
; expect (0 2 8)


(define (make-adder num)
  'YOUR-CODE-HERE
  (lambda (x) (+ x num))
)

;;; Tests
(define adder (make-adder 5))
(adder 8)
; expect 13


(define lst
  (list (list 1) 2 (list 3 4) 5)
)


(define (composed f g)
  'YOUR-CODE-HERE
  (lambda (x) (f (g x)))
)


(define (remove item lst)
  'YOUR-CODE-HERE
  (filter-lst (lambda (x) (not (= x item))) lst)
)


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)


(define (no-repeats s)
  'YOUR-CODE-HERE
  (cond ((null? s) '())
        ((member (car s) (cdr s))
         (no-repeats (cdr s)))
        (else (cons (car s) (no-repeats (cdr s)))))
)


(define (substitute s old new)
  'YOUR-CODE-HERE
  (if (null? s) nil
      (if (not (pair? (car s))) (if (eq? (car s) old) (cons new (substitute (cdr s) old new)) (cons (car s) (substitute (cdr s) old new)))
          (cons (substitute (car s) old new) (substitute (cdr s) old new))))
)


(define (sub-all s olds news)
  'YOUR-CODE-HERE
  (if (eq? (length olds) 1) (substitute s (car olds) (car news))
  (sub-all (substitute s (car olds) (car news)) (cdr olds) (cdr news)))
)

