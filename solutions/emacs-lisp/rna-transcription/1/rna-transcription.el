;;; rna-transcription.el -- RNA Transcription (exercism)  -*- lexical-binding: t; -*-

(defun to-rna (strand)
  (defconst strand-map
    '((?G . ?C)
      (?C . ?G)
      (?T . ?A)
      (?A . ?U)))
  (unless (seq-every-p (lambda (n) (alist-get n strand-map)) strand)
    error "unknown nucleotide")
  (concat (mapcar (lambda (n) (alist-get n strand-map n)) strand)))

(provide 'rna-transcription)
;;; rna-transcription.el ends here
