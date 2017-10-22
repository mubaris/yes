;;; Implementation of the unix yes command in chicken scheme

(require-extension srfi-13)

(let* ((args (command-line-arguments))
       (output (if (null? args) "y" (string-join args))))
  (let loop () (print output) (loop)))
