#lang scribble/manual
@require[@for-label[gaussian
                    racket/base]]
@require[scribble-math/dollar]

@title{gaussian}
@author{logc}

@defmodule[gaussian]

Gaussian is a collection of functions for statistical computation.

@section{Development history}

The first goal was to implement the
@hyperlink["https://en.wikipedia.org/wiki/Shapiro%E2%80%93Wilk_test"]{Shapiro-Wilk
normality test}. In the process to arrive there, the @${G_1} sample skewness was
required.
