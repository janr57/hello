;;;; main.lisp
;;;; Main file for the 'hello' program.
;;;;
;;;; The 'hello' program prints "Hello world!" in the standard output.
;;;;
;;;; Copyright (c) 2020 - José A. Navarro Ramón <janr.devel@gmail.com>
;;;; License: BSD 3-Clause

;;; Declaration specifier at compile time (unmark only one of them):
;;; a) In the development phase
(declaim (optimize (speed 0) (safety 3) (debug 3)))
;;; b) In the release phase
;;;(declaim (optimize (speed 3) (safety 3) (debug 0)))

#-ECL
(in-package :hello)

;;; $ ./myemacs_sbcl or $ ./myemacs_ccl
;;; Returns:
;;; 0 or 1 if run without or with errors.
;;; (EXPORTED FUNCTION)
(defun hello ()
  (format t "Hello world!~%"))

(defun main ()
  (hello))

#+ECL
(progn
(main)
(si:exit))

;;; ********
     
  
