;;; robot-name.el --- Robot Name (exercism)  -*- lexical-binding: t; -*-

(defvar *robots* (make-hash-table))

(defun random-name ()
  (let ((first (+ ?A (random (- ?Z ?A))))
		(second (+ ?A (random (- ?Z ?A))))
		(number (random 1000)))
	(format "%c%c%03d" first second number)))

(defun build-robot ()
  "Build a new robot with a random name."
  (cl-loop for new-name = (random-name)
		   when (null (gethash new-name *robots*))
		   return (puthash new-name new-name *robots*)))

(defun robot-name (robot)
  "Get the ROBOT's name."
  (gethash robot *robots*))

(defun reset-robot (robot)
  "Reset the name of ROBOT.  Factory reset!"
  (puthash robot (build-robot) *robots*))

(provide 'robot-name)
;;; robot-name.el ends here
