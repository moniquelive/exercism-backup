(ns meetup
  (:import [java.time DayOfWeek LocalDate]
           [java.time.temporal TemporalAdjusters]))

(def ^:private week-numbers
  {:first 1, :second 2, :third 3, :fourth 4})

(defn meetup [month year weekday week]
  (let [weekday (DayOfWeek/valueOf (.toUpperCase (name weekday)))
        date (LocalDate/of year month (if (= week :teenth) 13 1))
        adjuster (case week
                   :teenth (TemporalAdjusters/nextOrSame weekday)
                   :last (TemporalAdjusters/lastInMonth weekday)
                   (TemporalAdjusters/dayOfWeekInMonth
                    (week-numbers week) weekday))
        result (.with date adjuster)]
    [year month (.getDayOfMonth result)]))
