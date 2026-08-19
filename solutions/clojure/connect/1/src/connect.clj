(ns connect)

(def ^:private neighbor-offsets
  [[-1 0] [-1 1] [0 -1] [0 1] [1 -1] [1 0]])

(defn- connected? [board player starts destination?]
  (loop [frontier (vec starts)
         visited #{}]
    (if-let [[row column :as position] (peek frontier)]
      (cond
        (visited position)
        (recur (pop frontier) visited)

        (destination? position)
        true

        :else
        (let [neighbors (for [[row-offset column-offset] neighbor-offsets
                              :let [neighbor [(+ row row-offset)
                                              (+ column column-offset)]]
                              :when (= player (get-in board neighbor))]
                          neighbor)]
          (recur (into (pop frontier) neighbors)
                 (conj visited position))))
      false)))

(defn connect-winner [board]
  (let [board (mapv #(vec (remove #{\space} %)) board)
        height (count board)
        width (count (first board))
        x-starts (for [row (range height)
                       :when (= \X (get-in board [row 0]))]
                   [row 0])
        o-starts (for [column (range width)
                       :when (= \O (get-in board [0 column]))]
                   [0 column])]
    (cond
      (connected? board \X x-starts #(= (second %) (dec width))) :X
      (connected? board \O o-starts #(= (first %) (dec height))) :O
      :else :no-winner)))
