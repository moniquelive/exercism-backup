(ns gigasecond)

(defn from [year month day]
  (-> (. java.time.LocalDateTime of year month day 0 0)
      (.plusSeconds 1e9)
      ((juxt (memfn getYear) (memfn getMonthValue) (memfn getDayOfMonth)))))
