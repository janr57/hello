;;; make-native-exec.lisp

  #+SBCL
  (format t "Código para SBCL no implementado aún.~%")
  #+CCL
  (format t "Código para CCL no implementado aún.~%")
  #+ECL
  (progn
    (require 'cmp)
    (compile-file "src/packages.lisp" :system-p t)
    (compile-file "src/main.lisp" :system-p t)
    (c:build-program "hello"
		     :lisp-files '("src/main.o" "src/packages.o"))
    (si:exit))
 



