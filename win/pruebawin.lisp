;;;; pruebawin.lisp
;;;; Prueba windows LocaleName

(defun get-locale-name ()
  (let ((locale-name (remove #\Return (uiop:run-program "wrlocale.bat" :force-shell nil :output '(:string :stripped t)))))
    locale-name))

(defun get-locale-name-simple ()
  (let* ((locale-name-orig (uiop:run-program "wrlocale.bat" :force-shell nil :output '(:string :stripped t)))
         (locale-no-return (remove #\Return locale-name-orig))
         (locale-no-newline (remove #\Newline locale-no-return))
         (locale-reduced (remove "HKEY_CURRENT_USER" locale-no-newline)))
    ;;(format t "locale-name-orig -> ~a~%" locale-name-orig)
    (format nil "~a~%" locale-reduced)))

(defun get-locale-helper ()
  (multiple-value-bind (k) (get-locale-name-simple)
    (remove #\Newline (car (last (uiop:split-string k :separator " "))))))

(defun get-locale ()
  (let ((locale-helper (get-locale-helper)))
    (subseq locale-helper 0 (position #\- locale-helper))))



