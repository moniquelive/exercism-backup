(ns yacht)

(def ^:private numbers {"ones" 1 "twos" 2 "threes" 3 "fours" 4 "fives" 5 "sixes" 6})
(defn score [dice category]
  (let [dice* (sort dice)
        number (numbers category)
        freqs (frequencies dice)]
    (if number
      (* number (get freqs number 0))
      (case category
        "full house" (if (= (set (vals freqs)) #{2 3}) (reduce + dice) 0)
        "four of a kind" (or (some (fn [[face n]] (when (>= n 4) (* 4 face))) freqs) 0)
        "little straight" (if (= dice* [1 2 3 4 5]) 30 0)
        "big straight" (if (= dice* [2 3 4 5 6]) 30 0)
        "choice" (reduce + dice)
        "yacht" (if (= 1 (count freqs)) 50 0)))))
