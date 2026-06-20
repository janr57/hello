;;;; hello.asd
;;;; ASDF system definitions for 'hello'.
;;;;
;;;; The 'hello' program prints "Hello world!" in the standard output.
;;;;
;;;; Copyright (c) 2020 - José A. Navarro Ramón <janr.devel@gmail.com>
;;;; License: BSD 3-Clause

(defsystem :hello
  :version "0.1.0"
  :author "José A. Navarro Ramón"
  :license "BSD 3-Clause"
  :depends-on (:asdf)
  :description ""
  :serial t
  :components ((:module "src"
		:components
		((:file "packages")
	 	 (:file "make-executable")
		 (:file "main")))))


(defsystem :hello/executable
  :build-operation "program-op"
  :build-pathname "hello"
  :entry-point "hello:main"
  :depends-on ()
  :description ""
  :serial t
  :components ((:module "src"
		:components
			((:file "packages")
			 (:file "main")))))


  
