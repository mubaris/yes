#/usr/bin/clisp

(setf i 1)
(loop while (>= i 0) do (format t "~&~S~&" *args*))
