;;; gigasecond.el --- Gigasecond exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:
;; Calculate the date one gigasecond (10^9 seconds) from the
;; given date.
;;
;; NB: Pay attention to  Emacs' handling of time zones and dst
;; in the encode-time and decode-time functions.

(defun from (second minute hour day month year)
  (defconst gigasecond 1e9)
  (ntake 6
		(decode-time
		 (encode-time (+ gigasecond second) minute hour day month year 0) 0)))

(provide 'gigasecond)
;;; gigasecond.el ends here
