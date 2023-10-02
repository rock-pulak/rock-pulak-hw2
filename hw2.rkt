#lang racket
(provide (all-defined-out))

(require 2htdp/image)

; We need the size of, and horizontal center of, our window:
(define WINDOW-HEIGHT 300)
(define WINDOW-WIDTH  100)
(define OFFSET (/ WINDOW-WIDTH 2))
(define WINDOW (empty-scene WINDOW-WIDTH WINDOW-HEIGHT))
(define ROCKET (bitmap "rocket.png"))
(define ROCKET-CENTER (/ (image-height ROCKET) 2))
(define SPEED 3)

; An LRCD (for launching rocket countdown) is one of:
; – "resting"
; – a Number between -3 and -1
; – a NonnegativeNumber 
; interpretation a grounded rocket, in countdown mode,
; a number denotes the number of pixels between the
; top of the canvas and the rocket (its height)
(define (LRCD? x)
  (or (string? x)
      (nonnegative-integer? x)
      (and (integer? x)
           (<= -3 x -1))))

; LRCD -> Image
; renders the state as a resting or flying rocket 
(define (show x
  (cond
    [(string? x)
     (place-image ROCKET OFFSET (- WINDOW-HEIGHT ROCKET-CENTER) WINDOW)]
    [(<= -3 x -1)
     (place-image (text (number->string (abs x)) 20 "red")
                  OFFSET (* 3/4 WINDOW-WIDTH)
                  (place-image ROCKET
                               OFFSET (- WINDOW-HEIGHT ROCKET-CENTER)
                               WINDOW))]
    [(>= x 0)
     (place-image ROCKET OFFSET (- x ROCKET-CENTER) WINDOW)]))

; LRCD KeyEvent -> LRCD
; starts the countdown when space bar is pressed, 
; if the rocket is still resting 
(define (launch x ke)
  x)
 
; LRCD -> LRCD
; raises the rocket by YDELTA,
;  if it is moving already 
(define (fly x)
  x)



