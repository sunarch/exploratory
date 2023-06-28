#!/usr/bin/env chezscheme

(import (srfi s1 lists))
(import (sdl2))

(load-shared-object "/usr/lib/x86_64-linux-gnu/libSDL2.so")

(display (sdl-get-version SDL-VERSION))

(sdl-init SDL-INIT-VIDEO)

(define *window*
  (sdl-create-window
    "SDL2 on Scheme"
    SDL-WINDOWPOS-UNDEFINED
    SDL-WINDOWPOS-UNDEFINED
    800
    600
    SDL-WINDOW-SHOWN
    SDL-WINDOW-OPENGL))

(sleep (make-time 'time-duration 0 5))

(sdl-destroy-window window)

(sdl-quit)

(exit)
