(ns card-games)

(defn rounds [n] (range n (+ 3 n)))
(defn concat-rounds [l1 l2] (concat l1 l2))
(defn contains-round? [l n] (boolean (some #{n} l)))
(defn card-average [hand] (double (/ (reduce + hand) (count hand))))

(defn approx-average? [hand]
  (let [avg (card-average hand)]
    (or
     (== avg (/ (+ (first hand) (last hand)) 2))
     (== avg (nth hand (quot (count hand) 2))))))

(defn average-even-odd?
  [hand]
  (= (card-average (take-nth 2 hand))
     (card-average (take-nth 2 (rest hand)))))

(defn maybe-double-last
  [hand]
  (if (= 11 (last hand))
    (concat (butlast hand) [22])
    hand))
