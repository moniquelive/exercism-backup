(ns kindergarten-garden)

(def plants {\C :clover \G :grass \R :radishes \V :violets})
(defn garden [s]
  (let [[_ row1 row2] (re-matches #"(\w+)\n(\w+)" s)
        top_row (mapv plants row1)
        bottom_row (mapv plants row2)]
    (into {} (map #(identity [%1 (concat %2 %3)])
                  [:alice :bob :charlie :david :eve :fred :ginny
                   :harriet :ileana :joseph :kincaid :larry]
                  (partition 2 top_row)
                  (partition 2 bottom_row)))))
