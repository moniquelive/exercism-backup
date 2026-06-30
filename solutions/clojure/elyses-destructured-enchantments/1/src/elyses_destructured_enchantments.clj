(ns elyses-destructured-enchantments)

(defn first-card [[one _]] one)
(defn second-card [[_ two _]] two)
(defn swap-top-two-cards [[one two & remaining]] (into [two one] remaining))
(defn discard-top-card [[one & remaining]] [one remaining])
(def face-cards ["jack" "queen" "king"])
(defn insert-face-cards [[one & remaining :as deck]]
  (if (empty? deck) face-cards
      (concat [one] face-cards remaining)))
