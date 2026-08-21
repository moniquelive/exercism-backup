(ns pov)

(defn- branch-to [target [root & children :as tree]]
  (when root
    (if (= target root)
      [tree]
      (some (fn [child]
              (when-let [branch (branch-to target child)]
                (cons tree branch)))
            children))))

(defn of [target tree]
  (when-let [branch (branch-to target tree)]
    (reduce (fn [reoriented-parent [[root & children] child-on-branch]]
              (into [root]
                    (cond-> (vec (if child-on-branch
                                   (remove #{child-on-branch} children)
                                   children))
                      reoriented-parent (conj reoriented-parent))))
            nil
            (map vector branch (concat (rest branch) [nil])))))

(defn path-from-to [source destination tree]
  (some->> (of source tree)
           (branch-to destination)
           (mapv first)))
