(ns go-counting)

(def ^:private owner-by-stone {\B :black
                               \W :white})
(def ^:private territory-by-owner {:black :black-territory
                                   :white :white-territory
                                   nil :null-territory})

(defn- cell-at [board [column row]] (get-in board [row column]))

(defn- on-board? [board [column row]]
  (and (<= 0 row)
       (< row (count board))
       (<= 0 column)
       (< column (count (get board row)))))

(defn- neighboring-points [[column row]]
  [[(dec column) row] [(inc column) row]
   [column (dec row)] [column (inc row)]])

(defn- flood-territory [board starting-point]
  (loop [frontier #{starting-point}
         territory-points #{}
         neighboring-owners #{}]
    (if-let [point (first frontier)]
      (let [neighbors (filter (partial on-board? board)
                              (neighboring-points point))
            empty-neighbors (filter #(= \space (cell-at board %)) neighbors)]
        (recur (into (disj frontier point)
                     (remove territory-points empty-neighbors))
               (conj territory-points point)
               (into neighboring-owners
                     (keep #(owner-by-stone (cell-at board %)) neighbors))))
      {:stones territory-points
       :owner (when (= 1 (count neighboring-owners))
                (first neighboring-owners))})))

(defn territory [board position]
  (when-not (on-board? board position)
    (throw (ex-info "Position is outside the board" {:position position})))
  (if (= \space (cell-at board position))
    (flood-territory board position)
    {:stones #{} :owner nil}))

(defn territories [board]
  (let [empty-points (set (for [[row cells] (map-indexed vector board)
                                [column cell] (map-indexed vector cells)
                                :when (= \space cell)]
                            [column row]))]
    (loop [uncounted-points empty-points
           territories-by-owner {:black-territory #{}
                                 :white-territory #{}
                                 :null-territory #{}}]
      (if-let [point (first uncounted-points)]
        (let [{:keys [stones owner]} (flood-territory board point)]
          (recur (apply disj uncounted-points stones)
                 (update territories-by-owner
                         (territory-by-owner owner)
                         into stones)))
        territories-by-owner))))
