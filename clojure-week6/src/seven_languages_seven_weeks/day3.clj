(ns seven-languages-seven-weeks.day3
  (:require [seven-languages-seven-weeks.barber :as barber]))

(defn account [balance]
    (ref balance))
(defn transaction [direction account amount]
    (dosync (alter account direction amount)))
(defn credit [acct amount]
  (transaction + acct amount))
(defn debit [acct amount]
  (transaction - acct amount))
(defn balance [account]
  (deref account))

(defn run
  []
  (println "=== Running examples from day 3")
  (println "Use refs to create a vector of accounts in memory. Create debit and credit functions to change the balance of an account.")
  (def acc [(account 50), (account 100)])
  (credit (acc 0) 100)
  (debit (acc 0) 50)
  (println "after (+ 100)(- 50) account balance is:" (balance (acc 0)))
  (barber/open-shop))
