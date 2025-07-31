(ns leap)

(defn leap-year? [year] ;; <- argslist goes here
  (let [divBy4 (== 0 (mod year 4))
        divBy100 (== 0 (mod year 100))
        divBy400 (== 0 (mod year 400))]
    (or divBy400 (and divBy4 (not divBy100)))
  )
)
