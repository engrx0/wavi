(asdf:defsystem "wavi"
    :description "a lisp based real-time waveform visualizer"
    :author "engr"
    :depends-on ("cl-portaudio", "cl-opengl" "cl-glut")
    :components ((:file "src/main")
                (:file "src/audio")
                (:file "src/graphics")
                (:file "src/utils")))