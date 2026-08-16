(ns meetup
  (:import [java.time YearMonth LocalDate]))

(def ^:private weekdays
  (zipmap [:monday :tuesday :wednesday :thursday
           :friday :saturday :sunday]
          (range 1 8)))

(defn meetup [month year weekday week]
  (let [start (if (= week :last)
                (- (.lengthOfMonth (YearMonth/of year month)) 6)
                ({:first 1 :second 8 :third 15
                  :fourth 22 :teenth 13} week))
        offset (mod (- (weekdays weekday)
                       (->> (LocalDate/of year month start)
                            .getDayOfWeek
                            .getValue))
                    7)]
    [year month (+ start offset)]))
