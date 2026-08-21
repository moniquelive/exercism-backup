(ns pov)

(defn- branch-to [target [root & children :as tree]]
  (when root
    (if (= target root)
      [tree]
      (some #(some->> (branch-to target %)
                      (cons tree))
            children))))

(defn of [target tree]
  (some->> (branch-to target tree)
           (partition-all 2 1)
           (reduce (fn [reoriented-parent [node child-on-branch]]
                     (cond-> (vec (remove #{child-on-branch} node))
                       reoriented-parent (conj reoriented-parent)))
                   nil)))

(defn path-from-to [source destination tree]
  (some->> (of source tree)
           (branch-to destination)
           (mapv first)))
