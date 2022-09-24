#lang racket

(require racket/udp)

(let ([socket (udp-open-socket)])

(udp-bind!
    socket
    "0.0.0.0"
    6454
)

(udp-send-to
    socket
    "255.255.255.255"	 	 	 
    6454
    (bytes 65 112 112 108 101)	 	 	 	 
)

(udp-close socket)
)
