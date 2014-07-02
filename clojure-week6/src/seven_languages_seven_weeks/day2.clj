#!/usr/bin/env lein-exec
(ns seven-languages-seven-weeks.day2
  (:gen-class))

(defprotocol Compass
  (direction [c])
  (left [c])
  (right [c]))

(def directions [:north :east :south :west])

(defn turn
  [base amount]
  (rem (+ base amount)(count directions)))

(defrecord SimpleCompass [bearing]
  Compass
  (direction [_] (directions bearing))
  (left [_] (SimpleCompass. (turn bearing 3)))
  (right [_] (SimpleCompass. (turn bearing 1)))
  Object
  (toString [this] (str "[" (direction this) "]")))
;; Compass in Action:
;; (def c (SimpleCompass. 0))
;; (println (:bearing (left c)))

(defprotocol HTMLElement
  (tag [x])
  ; innerHTML?
  ; children?
  )

(defn htmlString
  [name content]
  (str "<" name ">" content  "</" name ">"))

(defrecord Tag [tagname content children]
  HTMLElement
  (tag [x] (htmlString tagname content))
  Object
  (toString [this] (str "[" (tag this)"]")))

(defmacro unless
  "Evaluates test. If falsy, returns ~body otherwise returns ~else if ~else is supplied. Stolen mostly if-not: https://github.com/clojure/clojure/blob/028af0e0b271aa558ea44780e5d951f4932c7842/src/clj/clojure/core.clj#L726"
  ([test body]
  `(if (not ~test) ~body))
  ([test body else]
  `(if (not ~test) ~body ~else)))
  ;; ([test body else] 'if ('not test) body else))



; kick things off
(do
  (println "running examples from day 2:")
  (println (unless false "unless singular"))
  (println (unless true "unless - I should not show up" "Unless else"))
  (def h1 (Tag. "h1"))
  (println (tag h1)))
