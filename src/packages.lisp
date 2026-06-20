;;;; packages.lisp
;;;; Defines the package 'hello'.

;;;; The 'hello' program prints "Hello world!" in the standard output.
;;;;
;;;; Copyright (c) 2020 - José A. Navarro Ramón <josea.navarro1@gmail.com>
;;;; License: BSD 3-Clause

(defpackage :hello
  (:use :cl)
  (:export :main :make-executable))

(in-package :hello)



