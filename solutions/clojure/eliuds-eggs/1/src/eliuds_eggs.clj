(ns eliuds-eggs)

(defn egg-count [num]
  (loop [num num
         cnt 0]
    (if (zero? num)
      cnt
      (recur (bit-shift-right num 1)
             (+ cnt (bit-and num 1))))))
