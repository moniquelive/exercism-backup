(ns beer-song)

(require '(clojure [string :as s]))

(defn verse
  "Returns the nth verse of the song."
  [num]
  (let [s (if (== num 2) "" "s")]
    (case num
      0 (str "No more bottles of beer on the wall, no more bottles of beer.\n"
             "Go to the store and buy some more, 99 bottles of beer on the wall.\n")
      1 (str "1 bottle of beer on the wall, 1 bottle of beer.\n"
             "Take it down and pass it around, no more bottles of beer on the wall.\n")
      (format (str "%d bottles of beer on the wall, %d bottles of beer.\n"
                   "Take one down and pass it around, %d bottle%s of beer on the wall.\n")
              num num
              (dec num) s))))

(defn sing
  "Given a start and an optional end, returns all verses in this interval. If
  end is not given, the whole song from start is sung."
  ([start] (sing start 0))
  ([start end] (->>
                (range start (dec end) -1)
                (map verse)
                (s/join "\n"))))
