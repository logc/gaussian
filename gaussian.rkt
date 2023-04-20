#lang racket/base

(require (only-in racket/list make-list))

(module+ test
  (require rackunit))

(define (avg X)
  (/ (for/sum ([x X]) x) (length X)))

(define (moment N X)
  (let ([n (length X)]
        [X-avg (avg X)])
    (* (1 . / . n)
       (for/sum ([x X]) (expt (x . - . X-avg) N)))))

;; cf. https://math.mit.edu/~rmd/465/shapiro.pdf
(define estimate-μ avg)

;; cf. https://math.mit.edu/~rmd/465/shapiro.pdf
(define (estimate-σ X)
  (let ([μ (estimate-μ X)]
        [n (length X)])
    (sqrt (* (1 . / . (n . - . 1))
             (for/sum ([x X]) (expt (x . - . μ) 2))))))

(define (g₁ X)
  (/ (moment 3 X)
     (expt (moment 2 X) 3/2)))

;; G_{1}: adjusted Fisher–Pearson standardized moment coefficient
;; cf. https://en.wikipedia.org/wiki/Skewness
(define (G₁ X)
  (let ([n (length X)])
    (* ((sqrt (* n (n . - . 1))) . / . (n . - . 2))
       (g₁ X))))

;; G_{1} is the version found in Excel and several statistical packages including SAS and SPSS
;; cf. https://en.wikipedia.org/wiki/Skewness
(define sample-skewness G₁)

;; TODO: Shapiro-Wilk normality test
;;   cf. https://en.wikipedia.org/wiki/Shapiro%E2%80%93Wilk_test
;;   cf. https://math.mit.edu/~rmd/465/shapiro.pdf
(define (shapiro–wilk-test sample)
  '())

(module+ test
  (check-equal? (estimate-μ (list 2 4 6)) 4)
  (check-equal? (estimate-σ (list 2 4 6)) 2)
  ;; cf. https://www.cuemath.com/skewness-formula/
  (let ([sample (append (make-list 5 61)
                        (make-list 18 64)
                        (make-list 42 67)
                        (make-list 27 70)
                        (make-list 8 73))])
    (check-= (sample-skewness sample) -0.109808408 1e-9))
  )
