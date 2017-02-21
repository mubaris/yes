(if (nth 0 *args*)
	(loop(format t "~{~A~^, ~}~%" *args*))
	(loop(format t "~d~%" "y")))
