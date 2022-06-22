(fiasco:define-test-package #:coalton-example-test-fiasco)

(defpackage #:coalton-example-test
  (:use
   #:coalton-testing)
  (:local-nicknames
   (#:example #:coalton-example)))

(in-package #:coalton-example-test)

(coalton-fiasco-init #:coalton-example-test-fiasco)
