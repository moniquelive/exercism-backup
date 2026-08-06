(ns binary-search-tree)

(def value :value)
(def left :left)
(def right :right)
(defn singleton [val] {:value val})

(defn insert [val node]
  (if node
    (let [branch (if (> val (value node)) :right :left)]
      (update node branch #(insert val %)))
    (singleton val)))

(defn to-list [{:keys [left value right] :as node}]
  (if node
    (concat (to-list left) [value] (to-list right))
    []))

(defn from-list [lst]
  (reduce (fn [tree val] (insert val tree))
          nil lst))
