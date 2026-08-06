(ns grade-school)

(defn grade [school grade]
  (get school grade []))

(defn add [school name grade]
  (update school grade #(conj (vec %) name)))

(defn sorted [school]
  (-> (sorted-map)
      (into school)
      (update-vals sort)))
