(ns bird-watcher)

(def last-week [0 2 5 3 7 8 4])
(defn today [birds] (last birds))
(defn day-without-birds? [birds] (.contains birds 0))
(defn n-days-count [birds n] (reduce + (take n birds)))
(defn busy-days [birds] (count (filter (partial <= 5) birds)))
(defn inc-bird [birds] (conj (pop birds) (inc (peek birds))))
(defn odd-week? [birds]
  (let [grouped (group-by even? birds)]
    (and (every? zero? (get grouped true))
         (every? (partial == 1) (get grouped false)))))
