(ns seven-languages-seven-weeks.barber)

; No need for this atm
; (def start (System/currentTimeMillis))
(def timeout 10000)
(def queueSize 3)

(defn wrapQueue
  "provides a mechanism that adds to a queue up to a maximum size"
  [queue limit]
  (fn
    [item]
    (if (< (count @queue) limit)
      (send queue conj item))))

(defn haircut
  "cuts hair and increments barber"
  [barber]
  ; a quality haircut takes time...
  (Thread/sleep 20)
  ;; (println "haircut given")
  (+ 1 barber))

; add customers to the queue -- barbarians at the gates!
(defn street
    "adds customers every 10-30 seconds"
    [addFn]
    (future (while true
      (Thread/sleep (+ 10 (rand-int 20)))
      ;; (println "customer enters")
      (addFn "Customer"))))

; check in with the barber.
; if he's not occupied and there is someone in the queue
; get the agent a haircut
(defn line
    "sends customers to barber"
    [queue barber]
    (future (while true
          (await barber)
          (if (not (empty? @queue))
            (send queue pop)
            (send barber haircut)))))

(defn open-shop
  []
  (println "--- Barber shop is open for business")
  (def queue (agent []))
  (def barber(agent 0))

  (def addToQueue (wrapQueue queue queueSize))

  ; kick off threaded stuff
  (street addToQueue)
  (line queue barber)

  ; stall our main thread until we've reached our time limit
  (Thread/sleep timeout)
  (println "--- Wrapping up")
  ; kill threads
  (shutdown-agents)
  (println "****** Results ******")
  (println "haircuts given " @barber))

