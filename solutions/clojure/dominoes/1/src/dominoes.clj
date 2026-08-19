(ns dominoes)

(defn can-chain? [dominoes]
  (if-let [[[chain-start open-end] & unplaced-dominoes] (seq dominoes)]
    (letfn [(chainable? [open-end unplaced-dominoes]
              (if (empty? unplaced-dominoes)
                (= chain-start open-end)
                (boolean
                 (some (fn [[index [left right]]]
                         (let [remaining-dominoes
                               (concat (take index unplaced-dominoes)
                                       (drop (inc index) unplaced-dominoes))]
                           (cond
                             (= open-end left) (chainable? right remaining-dominoes)
                             (= open-end right) (chainable? left remaining-dominoes))))
                       (map-indexed vector unplaced-dominoes)))))]
      (chainable? open-end unplaced-dominoes))
    true))
