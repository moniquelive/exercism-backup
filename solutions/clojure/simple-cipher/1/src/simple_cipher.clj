(ns simple-cipher)

(def ^:private a-code (int \a))
(def ^:private alphabet-size 26)

(defn rand-key [] (apply str (repeatedly 100 #(char (+ a-code (rand-int alphabet-size))))))

(defn- transform [op key text]
  (apply str
         (map #(char (+ a-code
                        (mod (op (- (int %1) a-code)
                                 (- (int %2) a-code))
                             alphabet-size)))
              text
              (cycle key))))

(defn encode [key text] (transform + key text))
(defn decode [key text] (transform - key text))
