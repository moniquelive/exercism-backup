;;; rail-fence-cipher.el --- Rail Fence Cipher (exercism)  -*- lexical-binding: t; -*-

(defun encode (message rails)
  (cl-loop for ch across message
           with result = (make-vector rails "")
           with delta = 1
           for rail = 0 then (+ rail delta)

           if (< rail 0) do (setq rail 1 delta 1) ;; zig
           if (>= rail rails) do (setq rail (- rails 2) delta -1) ;; zag

           ;; result[rail] << ch
           do (aset result rail
                    (concat (aref result rail) (char-to-string ch)))

           finally return (mapconcat 'identity result)))

(defun decode (message rails)
  (let* ((marks
          (cl-loop for n below (length message)
                   with result = (cl-map 'vector #'(lambda (_) (make-string 80 ?\s)) (make-vector rails nil))
                   with delta = 1
                   for rail = 0 then (+ rail delta)

                   if (< rail 0) do (setq rail 1 delta 1) ;; zig
                   if (>= rail rails) do (setq rail (- rails 2) delta -1) ;; zag

                   ;; result[rail][n] = '*'
                   do (setf (aref (aref result rail) n) ?*)

                   finally return (cl-map 'vector #'string-trim-right result)))
         (zigged
          (cl-loop for m across marks
                   with msg = (cl-map 'list #'identity message)
                   with pick = (lambda (acc ch)
                                 (when (eq ch ?*) (setf ch (pop msg)))
                                 (concat acc (char-to-string ch)))
                   collect (seq-reduce pick m "")))
         (result
          (cl-loop for n below (length message)
                   with delta = 1
                   for rail = 0 then (+ rail delta)

                   if (< rail 0) do (setq rail 1 delta 1) ;; zig
                   if (>= rail rails) do (setq rail (- rails 2) delta -1) ;; zag

                   ;; cherry pick...
                   collect (aref (elt zigged rail) n)))
         )
    (apply #'string result)))

(provide 'rail-fence-cipher)
;;; rail-fence-cipher.el ends here
