(ns interest-is-interesting)

(defn interest-rate
  "Returns the interest rate based on the specified balance."
  [balance]
  (cond
    (neg? balance) -3.213
    (< balance 1000) 0.5
    (>= balance 5000) 2.475
    :else 1.621))

(defn annual-balance-update
  "Returns the annual balance update, taking into account the interest rate."
  [balance]
  (let [rate (* balance (/ (bigdec (interest-rate balance)) 100.0M))]
    (if (neg? balance)
      (- balance rate)
      (+ balance rate))))

(defn amount-to-donate
  "Returns how much money to donate based on the balance and the tax-free percentage."
  [balance tax-free-percentage]
  (if (neg? balance)
    0
    (int (/ (* 2 balance tax-free-percentage) 100))))
