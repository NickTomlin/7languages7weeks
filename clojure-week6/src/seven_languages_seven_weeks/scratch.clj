#!/usr/bin/env lein-exec
(ns seven-languages-seven-weeks.scratch)

(defprotocol Concatentable
  (cat [this other]))
(extend-type String
  Concatentable
  (cat [this other]
    (.concat this other)))
(extend-type java.util.List
  Concatentable
  (cat [this other]
    (concat this other)))
(defn foo [bar baz]
  (let [y bar x baz]
    (println x y)))
;; Atom Cache
(defn create
  []
  (atom {}))
(defn get
  [cache key]
  (@cache key))
(defn put
  ([cache value-map]
   (swap! cache merge value-map))
  ([cache key value]
   (swap! cache assoc key value)))

(do
  (println (cat "House" " of Leaves")
           (cat [1 2 3] [4 5 6]))
  (def ac (create))
  (put ac :quote "I'm your father, Luke")
  (println (str "Cached item: " (get ac :quote)))
  (foo "biz" "baz"))
