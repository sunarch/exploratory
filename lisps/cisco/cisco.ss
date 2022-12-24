#!/usr/bin/env chezscheme

; https://fosstodon.org/@yakkoj/109531403187870756

(library-directories "~/Documents/programlibs/thunderchez")
(import (srfi s1 lists))

; strings and number-code; strings and number-codes

(define text "OpenWrt")
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

; v2

(write "v2")(newline)

(define diff-minus-2 (diff d-minus text-ords output-ords))
(write diff-minus-2)(newline)

(define ord-a (char->integer #\A))
(define offset (- (char->integer #\Z) (- ord-a 1)))
(define int-offset (map (lambda (x) (+ ord-a x)) diff-minus-2))
(write int-offset)(newline)

(define int-offset-mod (map (lambda (x) (+ ord-a (mod x offset))) diff-minus-2))
(write int-offset-mod)(newline)

(define (chars int-list) (list->string (map integer->char int-list)))

(define int-chars (chars int-offset-mod))
(write int-chars)(newline)

(newline)

; end

(exit)

