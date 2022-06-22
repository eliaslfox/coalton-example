(asdf:defsystem #:coalton-example
  :description "An example Coalton project"
  :author "Elias Lawson-Fox <me@eliaslfox.com>"
  :license "MIT"
  :depends-on (#:coalton)
  :version (:read-file-form "VERSION.txt")
  :in-order-to ((asdf:test-op (asdf:test-op #:coalton-example/test)))
  :around-compile (lambda (compile)
                    (let (#+sbcl (sb-ext:*derive-function-types* t)
                          #+sbcl (sb-ext:*block-compile-default* :specified))
                      (funcall compile)))
  :pathname "src/"
  :serial t
  :components ((:file "package")
               (:file "main")))

(asdf:defsystem #:coalton-example/test
  :author "Elias Lawson-Fox <me@eliaslfox.com>"
  :license "MIT"
  :depends-on (#:coalton-example
               #:coalton/testing)
  :perform (asdf:test-op (o s)
                         (unless (symbol-call
                                  :fiasco
                                  :run-package-tests
                                  :package
                                  '#:coalton-example-test-fiasco)
                           (error "Tests failed")))
  :pathname "test/"
  :serial t
  :components ((:file "package")
               (:file "main")))
