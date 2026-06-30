(ns elyses-destructured-enchantments)

(defn first-card [[one]] one)
(defn second-card [[_ two]] two)
(defn swap-top-two-cards [[one two & remaining]] (concat [two one] remaining))
(defn discard-top-card [[one & remaining]] [one remaining])
(def face-cards ["jack" "queen" "king"])
(defn insert-face-cards [[one & remaining]]
  (filter boolean (concat [one] face-cards remaining)))
