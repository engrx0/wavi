(defpackage :wavi.audio
    (:use :cl)
    (:export :load-audio-file))

(in-package :wave.audio)

(ql:quickload "cl-portaudio")

(defparameter *sample-rate* 44100)
(defparameter *buffer-size* 1024)

(defun load-audio-file (filepath)
    "loads a WAV file and returns a buffer of raw PCM data"
    (let ((buffer (make-array *buffer-size* :element-type 'single-float)))
        (pa:with-audio-stream (stream :input nil :output t: sample-rate *sample-rate* :frames-per-buffer *buffer-size*)
            (pa:open-default-stream stream)
            (pa:read-stream stream buffer *buffer-size*))
        buffer)) ;; returns a buffer of audio samples