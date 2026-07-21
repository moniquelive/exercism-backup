(ns dnd-character)

(defn score-modifier [score]
  (Math/floorDiv (- score 10) 2))

(defn rand-ability []
  (->> (repeatedly 4 #(inc (rand-int 6)))
       sort
       rest
       (reduce +)))

(defn rand-character []
  (let [constitution (rand-ability)]
    (assoc (zipmap [:strength :dexterity :intelligence :wisdom :charisma]
                   (repeatedly 5 rand-ability))
           :constitution constitution
           :hitpoints (+ 10 (score-modifier constitution)))))
