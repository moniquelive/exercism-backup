(ns state-of-tic-tac-toe)

(defn gamestate [board]
  (let [marks (frequencies (apply str board))
        x (get marks \X 0)
        o (get marks \O 0)
        diagonals (for [cols [[0 1 2] [2 1 0]]]
                    (map nth board cols))
        lines (concat board (apply map vector board) diagonals)
        x-wins? (some #(every? #{\X} %) lines)
        o-wins? (some #(every? #{\O} %) lines)]
    (cond
      (> o x) (throw (IllegalArgumentException. "Wrong turn order: O started"))
      (> x (inc o)) (throw (IllegalArgumentException. "Wrong turn order: X went twice"))

      (or (and x-wins? (not= x (inc o)))
          (and o-wins? (not= x o)))
      (throw (IllegalArgumentException. "Impossible board: game should have ended after the game was won"))

      (or x-wins? o-wins?) :win
      (= 9 (+ x o)) :draw
      :else :ongoing)))
