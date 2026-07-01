(ns high-scores)

(defn scores [scores] scores)
(defn latest [scores] (last scores))
(defn personal-best [scores] (apply max scores))
(defn personal-top-three [scores] (->> scores sort reverse (take 3)))
