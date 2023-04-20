#lang info
(define collection "gaussian")
(define deps '("base"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/gaussian.scrbl" ())))
(define pkg-desc "Library of statistical functions")
(define version "0.1")
(define pkg-authors '(logc))
(define license '(MIT))
