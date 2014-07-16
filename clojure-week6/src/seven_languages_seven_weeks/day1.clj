(ns seven-languages-seven-weeks.day1
  (:require [clojure.string :as String]))

(defn big
  "returns true if a given <string> is biggern than <n> characters"
  [string n]
  (> (count string) n))

(defn collection-type
  "returns :list, :map, :vector based on the type of <col>"
  [col]
  (def types {:PersistentVector ":vector",
    :PersistentArrayMap ":map",
    :PersistentList ":list"})
   (keyword (last (String/split (str (type col)) #"\."))))


(defn run
  []
  (println "=== running examples from day 1:")
  (let [string  "four" length 4]
    (println "is" string "longer than?" length
    (big string length)))
  (doseq [x [{:foo "bar"} '(1 2 3) [:1 :2 :3]]] (println x " is a: "(collection-type x))))
