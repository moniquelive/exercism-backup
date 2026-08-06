(ns coordinate-transformation)

(defn translate2d [dx dy] #(vector (+ dx %1) (+ dy %2)))
(defn scale2d [sx sy] #(vector (* sx %1) (* sy %2)))
(defn compose-transform [f g] (fn [& args] (apply g (apply f args))))
(defn memoize-transform [f] (let [mem (atom {})]
                              (fn [& args]
                                (if-let [e (find @mem args)]
                                  (val e)
                                  (let [ret (apply f args)]
                                    (reset! mem {args ret})
                                    ret)))))
