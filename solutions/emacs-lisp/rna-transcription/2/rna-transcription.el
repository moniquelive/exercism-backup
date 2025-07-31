;;; rna-transcription.el -- RNA Transcription (exercism)  -*- lexical-binding: t; -*-

(defun to-rna (strand)
  (defun nucleotide(n)
    (cl-ecase n
      (?G ?C)
      (?C ?G)
      (?T ?A)
      (?A ?U)))
  (cl-map 'string #'nucleotide strand))

(provide 'rna-transcription)
;;; rna-transcription.el ends here
