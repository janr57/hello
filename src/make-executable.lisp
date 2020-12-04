;;; make-executable.lisp

#-ECL
(in-package :hello)

(defun make-executable (&optional (type :asdf))
  (cond
    ((eql :asdf type) (make-asdf-exec))
    ((eql :native type) (make-native-exec))
    (t (format t "Parámetro '~a' no reconocido.~%" type))))


(defun make-native-exec ()
  (format t "(make-native-exec)~%")
  #+SBCL
  (format t "Código para SBCL no implementado aún.~%")
  #+CCL
  (format t "Código para CCL no implementado aún.~%")
  #+ECL
  (progn
    (require 'cmp)
    (compile-file "packages.lisp" :system-p t)
    (compile-file "main.lisp" :system-p t)
    (c:build-program "hello"
		     :lisp-files '("main.o" "packages.o"))))

(defun make-asdf-exec ()
  (format t "(make-asdf-exec)~%")
  #+SBCL
  (format t "Código para SBCL no implementado aún.~%")
  #+CCL
  (format t "Código para CCL no implementado aún.~%")
  #+ECL
  (progn
    ;;(require 'cmp)
    (asdf:make-build :hello
		     :type :program
		     :move-here #P".."
		     :epilogue-code '(si:exit))))

	  
    

;;(defun make-executable (type)
;;  (case type
;;    ('native
;;     #+ecl
;;     (progn
;;       (require 'cmp)
;;       (compile-file "src/packages.lisp" :system-p t)
;;       (compile-file "src/main.lisp" :system-p t)
;;       (c:build-program "hello"
;;			:lisp-files '("src/main.o" "src/packages.o")))
;;     #+sbcl
;;     (format t "Code not implemented yet!~%")
;;     #+ccl
;;     (format t "Code not implemented yet!~%")))
;;  ('asdf
;;   #+ecl
;;   (asdf:make-build :hello 
;;                    :type :program 
;;                    :move-here #P"./"
;;                    :epilogue-code '(si:exit))
;;   #+sbcl
;;   (format t "Code not implemented yet!~%")
;;   #+ccl
;;   (format t "Code not implemented yet!~%"))
;;  (otherwise (format t "Function parameter ~a not supported~%" type)))


