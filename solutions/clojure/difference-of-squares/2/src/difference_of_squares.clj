(ns difference-of-squares)

(defn square-of-sum [N] (let [s (* N (inc N) 1/2)] (* s s)))
(defn sum-of-squares [N] (* N (inc N) (+ 1 N N) 1/6))
(defn difference [N] (- (square-of-sum N) (sum-of-squares N)))
