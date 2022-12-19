#!/usr/bin/env chezscheme

; https://fosstodon.org/@yakkoj/109531403187870756

(library-directories "~/Documents/github/z-reference/ovenpasta/thunderchez")
(import (srfi s1 lists))

; strings and number-code; strings and number-codes

(define text "OpenWRT")
(define output (make-string (string-length text) #\A))

(define (ords str) (map char->integer (string->list str)))

(define output-ords (ords output))
(write output)(newline)
(write output-ords)(newline)
(newline)

(define text-ords (ords text))
(write text)(newline)
(write text-ords)(newline)
(newline)

; differences between the two lists

(define (diff func x y) (map func (zip x y)))
(define (d-minus x) (fold-left - (car x) (cdr x)))

(define diff-minus (diff d-minus output-ords text-ords))
(write diff-minus)(newline)

(newline)

; list element differences

(define (list-head x) (reverse (cdr (reverse x))))
(define (seq-diff x) (diff d-minus (cdr x) (list-head x)))

(write (list-head diff-minus))(newline)
(write (cdr diff-minus))(newline)
(newline)
(define diff-minus-seq-diff (seq-diff diff-minus))
(write diff-minus-seq-diff)(newline)

(newline)

; end

(exit)

