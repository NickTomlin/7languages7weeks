(ns seven-languages-seven-weeks.day2)

(defmacro unless
  "Evaluates test. If falsy, returns ~body otherwise returns ~else if ~else is supplied. Stolen mostly if-not: https://github.com/clojure/clojure/blob/028af0e0b271aa558ea44780e5d951f4932c7842/src/clj/clojure/core.clj#L726"
  ([test body]
  `(if (not ~test) ~body))
  ([test body else]
  `(if (not ~test) ~body ~else)))

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

;; This is a failed attempt
;; at recreating a "mutubalish" DOM in clojure
(defprotocol HTMLElement
  (innerHTML [x])
  ; textContent
  ; children?
  )

(defn htmlString
  [element tagName content]
  (str "<" tagName  ">" content  "</" tagName ">"))

(defrecord Tag [tagname content]
  HTMLElement
  (innerHTML [x] (htmlString x tagname content))
  ;; (textContent [x text] (setTextContent x text))
  Object
  (toString [this] (str "[" (innerHTML this)"]")))

(defprotocol Angry
  (loud [x]))

(extend-type String
  Angry
  (loud [this] (str (clojure.string/upper-case this) "!!!")))

;; (extend-type Array
;;   Angry
;;   (loud [this] (each #{ (str (capitalize %) "!")})))

; kick things off
(defn run
  []
  (println "=== running examples from day 2:")
  (println (unless false "unless singular"))
  (println (unless true "unless - I should not show up" "Unless else"))
  (def h1 (Tag. "h1" "foo"))
  (println (innerHTML h1))
  (println "applying loud() to foo: "(loud "foo")))
