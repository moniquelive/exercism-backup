;;; acronym.el --- Acronym (exercism)  -*- lexical-binding: t; -*-

(defun acronym (phrase)
  (let* ((words (split-string phrase "[ -]"))
	 (initials (mapcar #'seq-first words)))
    (upcase (concat initials))))

(provide 'acronym)
;;; acronym.el ends here
