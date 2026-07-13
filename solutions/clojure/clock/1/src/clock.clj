(ns clock)

(def ^:private minutes-in-day (* 24 60))

(defn clock->string [clock] (format "%02d:%02d" (quot clock 60) (mod clock 60)))
(defn clock [hours minutes] (mod (+ (* hours 60) minutes) minutes-in-day))
(defn add-time [clock minutes] (mod (+ clock minutes) minutes-in-day))
