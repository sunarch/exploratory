#!/usr/bin/env hy

; https://fosstodon.org/@yakkoj/109531403187870756

(setv text "OpenWRT")
(setv output (* "A" (len text)))

(defn ords [iterable] (list (map ord iterable)))

(defn diff [func x y] (list (map func (zip x y))))
(defn d-minus [x] (hy.pyops.reduce hy.pyops.- x))

(setv text-ords (ords text))
(print text-ords)
(setv output-ords (ords output))
(print output-ords)
(setv diff-minus (diff d-minus output-ords text-ords))
(print diff-minus)
(for [i (range (- (len diff-minus) 1))]
    (print (- (get diff-minus (+ i 1)) (get diff-minus i))))

