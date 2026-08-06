(ns allergies)

(def ^:private allergens [:eggs :peanuts :shellfish :strawberries :tomatoes :chocolate :pollen :cats])
(defn allergic-to? [score allergen] (bit-test score (.indexOf allergens allergen)))
(defn allergies [score] (filterv #(allergic-to? score %) allergens))
