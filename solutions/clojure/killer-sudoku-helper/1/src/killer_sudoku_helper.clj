(ns killer-sudoku-helper)

(defn combinations [{:keys [sum size exclude]}]
  (letfn [(choose [[digit & digits] n total]
            (cond
              (zero? n) (when (zero? total) [[]])
              digit (concat (map #(cons digit %)
                                 (choose digits (dec n) (- total digit)))
                            (choose digits n total))))]
    (mapv vec
          (choose (remove (set exclude)
                          (range 1 10))
                  size
                  sum))))
