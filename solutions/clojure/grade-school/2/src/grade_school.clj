(ns grade-school)

(defn grade [school grade]
  (school grade []))

(defn add [school name grade]
  (update school grade concat [name]))

(defn sorted [school]
  (->
   (into (sorted-map) school)
   (update-vals sort)))
