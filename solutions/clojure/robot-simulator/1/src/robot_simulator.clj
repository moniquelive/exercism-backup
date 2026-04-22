(ns robot-simulator)

(def bearings [:north :east :south :west])
(def movement {:north {:x 0 :y 1}
               :east {:x 1 :y 0}
               :south {:x 0 :y -1}
               :west {:x -1 :y 0}})

(defn robot [coordinates direction] {:bearing direction :coordinates coordinates})

(defn- turn [bearing instruction]
  (let [ring (if (= instruction \R) bearings (reverse bearings))]
    (->> (cycle ring)
         (drop-while #(not= % bearing))
         second)))

(defn- advance [robot-state]
  (let [{:keys [x y]} (movement (:bearing robot-state))]
    (-> robot-state
        (update-in [:coordinates :x] + x)
        (update-in [:coordinates :y] + y))))

(defn simulate
  [instructions robot-state]
  (reduce (fn [robot instruction]
            (case instruction
              \R (update robot :bearing turn instruction)
              \L (update robot :bearing turn instruction)
              \A (advance robot)))
           robot-state instructions))
