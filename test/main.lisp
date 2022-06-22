(in-package #:coalton-example-test)

(define-test test-add3 ()
  (is (== 5 (example:add3 2)))
  (is (== 7 (example:add3 4))))
