(ns squeaky-clean
  (:require [clojure.string :refer [replace]]))

(defn clean [s]
  (-> s
      (replace " " "_")
      (replace #"-(\p{L})" #(.toUpperCase (%1 1)))
      (replace #"[\u0000-\u001f\u007f-\u009f]" "CTRL")
      (replace #"[^_\p{L}]|[α-ω]" "")))
