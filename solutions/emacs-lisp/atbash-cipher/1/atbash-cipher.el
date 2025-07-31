;;; atbash-cipher.el --- Atbash-Cipher (exercism)  -*- lexical-binding: t; -*-

(defun is-lower-p (ch)
  (string= "Ll" (get-char-code-property ch 'general-category)))
(defun cipherLower (ch)
  (let ((pos (seq-position "abcdefghijklmnopqrstuvwxyz" ch)))
	(seq-elt "zyxwvutsrqponmlkjihgfedcba" pos)))
(defun go (ch)
  (if (is-lower-p ch) (cipherLower ch) ch))
(defun encode (plaintext)
  (let* ((clean (replace-regexp-in-string "[^a-z0-9]" "" (downcase plaintext))))
	(string-join
	 (mapcar (apply-partially #'mapconcat #'byte-to-string)
			 (seq-split (seq-map 'go clean) 5)) " ")))

(provide 'atbash-cipher)
;;; atbash-cipher.el ends here
