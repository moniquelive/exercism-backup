(ns robot-name)

(def ^:private all-chars "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
(def ^:private all-used (atom #{}))
(defn- gen-name []
  (let [name (str (rand-nth all-chars)
                  (rand-nth all-chars)
                  (format "%03d" (rand-int 1000)))
        [prev-used] (swap-vals! all-used conj name)]
    (if (prev-used name) (recur) name)))
(defn robot [] (atom (gen-name)))
(defn robot-name [robot] @robot)
(defn reset-name [robot] (reset! robot (gen-name)))
