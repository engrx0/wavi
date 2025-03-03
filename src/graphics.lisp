(defpackage :wavi.graphics
    (:use :cl)
    (:export :draw-waveform))

(in-package :wave.graphics)

(ql:quickload "cl-opengl")
(ql:quickload "cl-glut")

(defun normalize-buffer (buffer width height)
    "normalizes audio samples to fit within the window"
    (let ((max-val (reduce #'max buffer))
        (min-val (reduce #'min buffer)))
        (mapcar (lambda (sample)
            (let ((normalized (- (/ (- sample min-val) (- max-val min-val)) 0.5)))
                (list (* (random width)) (* normalized height))))
            buffer)))

(defun draw-waveform (buffer)
    "draws the audio waveform using OpenGL"
    (gl:clear :color-buffer-bit)
    (gl:color3f 0.0 1.0 0.0) ;; green waveform
    (gl:begin :line-strip)

    (let ((points (normalize-buffer buffer 800 400)))
        (loop for (x,y) in points do
        (gl:vertex2f x y)))
    
    (gl:end)
    (gl:flush))