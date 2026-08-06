(ns space-age)

(def ^:private factors {:earth 1.0
                        :mercury 0.2408467
                        :venus 0.61519726
                        :mars 1.8808158
                        :jupiter 11.862615
                        :saturn 29.447498
                        :uranus 84.016846
                        :neptune 164.79132})
(def ^:private earth-year-seconds (* 60 60 24 365.25))
(defn- age-on [planet seconds] (/ seconds earth-year-seconds (factors planet)))

(defn on-earth [seconds] (age-on :earth seconds))
(defn on-mercury [seconds] (age-on :mercury seconds))
(defn on-venus [seconds] (age-on :venus seconds))
(defn on-mars [seconds] (age-on :mars seconds))
(defn on-jupiter [seconds] (age-on :jupiter seconds))
(defn on-saturn [seconds] (age-on :saturn seconds))
(defn on-uranus [seconds] (age-on :uranus seconds))
(defn on-neptune [seconds] (age-on :neptune seconds))
