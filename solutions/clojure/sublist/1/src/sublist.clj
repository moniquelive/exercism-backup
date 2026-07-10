(ns sublist)

(defn classify [coll1 coll2]
  (letfn [(contains-sublist? [coll candidate] (not= -1 (java.util.Collections/indexOfSubList coll candidate)))]
    (cond
      (= coll1 coll2) :equal
      (contains-sublist? coll1 coll2) :superlist
      (contains-sublist? coll2 coll1) :sublist
      :else :unequal)))
