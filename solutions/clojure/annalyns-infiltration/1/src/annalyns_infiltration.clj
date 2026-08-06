(ns annalyns-infiltration)

(defn can-fast-attack?
  [knight-awake?]
  (not knight-awake?))

(defn can-spy?
  [knight-awake? archer-awake? prisoner-awake?]
  (or knight-awake? archer-awake? prisoner-awake?))

(defn can-signal-prisoner?
  [archer-awake? prisoner-awake?]
  (and prisoner-awake? (not archer-awake?)))

(defn can-free-prisoner?
  [knight-awake? archer-awake? prisoner-awake? dog-present?]
  (if dog-present? (not archer-awake?)
      (and prisoner-awake? (not archer-awake?) (not knight-awake?))))
