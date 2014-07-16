(ns seven-languages-seven-weeks.core
  (:require
    [seven-languages-seven-weeks
     [day1 :as day1]
     [day2 :as day2]
     [day3 :as day3]])
  (:gen-class))

(defn -main
  "Kick off examples. Unfortunately the (System/exit) call seems necessary to prevent indefinite hang when using `lein run`"
  [& args]
  (day1/run)
  (day2/run)
  (day3/run)
  (shutdown-agents)
  (System/exit 0))
