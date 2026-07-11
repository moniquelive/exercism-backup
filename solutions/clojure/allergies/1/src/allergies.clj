(ns allergies)

(def ^:private allergens {:eggs 1, :peanuts 2, :shellfish 4, :strawberries 8,
                          :tomatoes 16, :chocolate 32, :pollen 64, :cats 128})
(def ^:private allergens-order [:eggs :peanuts :shellfish :strawberries :tomatoes :chocolate :pollen :cats])
(defn allergic-to? [score allergen] (pos? (bit-and score (allergens allergen 0))))
(defn allergies [score] (filter #(allergic-to? score %) allergens-order))
