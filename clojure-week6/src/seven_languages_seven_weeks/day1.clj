#!/usr/bin/env lein-exec
; this file is built to be run by lein exec https://github.com/kumarshantanu/lein-exec#writing-code-to-eval-with-lein-exec

(ns seven-languages-seven-weeks.day1
  (:gen-class)
  (:require [clojure.string :as string]))

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
   (keyword (last (string/split (str (type col)) #"\."))))

; kick things off
(do
  (println "running examples from day 1:")
  (let [string  "four" length 4]
    (println "is" string "longer than?" length
    (big string length))
    )
  (doseq [x [{:foo "bar"} '(1 2 3) [:1 :2 :3]]] (println (collection-type x))))
