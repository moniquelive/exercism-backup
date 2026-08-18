(ns say)

(def ^:private small-number-names
  ["zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine" "ten" "eleven"
   "twelve" "thirteen" "fourteen" "fifteen" "sixteen" "seventeen" "eighteen" "nineteen"])
(def ^:private tens-names
  [nil nil "twenty" "thirty" "forty" "fifty" "sixty" "seventy" "eighty" "ninety"])
(def ^:private number-scales
  [[1000000000 "billion"]
   [1000000 "million"]
   [1000 "thousand"]
   [100 "hundred"]])
(defn number [value]
  (when-not (<= 0 value 999999999999)
    (throw (IllegalArgumentException.)))
  (cond
    (< value 20)
    (small-number-names value)

    (< value 100)
    (let [tens-digit (quot value 10)
          ones-digit (mod value 10)]
      (str (tens-names tens-digit)
           (when (pos? ones-digit)
             (str "-" (small-number-names ones-digit)))))

    :else
    (let [[divisor scale-name] (some (fn [[divisor :as scale]]
                                       (when (>= value divisor) scale))
                                     number-scales)
          quotient (quot value divisor)
          remainder (mod value divisor)]
      (str (number quotient) " " scale-name
           (when (pos? remainder)
             (str " " (number remainder)))))))
