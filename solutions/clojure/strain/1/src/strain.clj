(ns strain)

(def retain filter)
(defn discard [pred coll] (filter (comp not pred) coll))
