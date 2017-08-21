(ns clojure.yes
   (:gen-class))

(use '[clojure.string :only (join split)])

(defn getstr
  [args]
  (if ( >= (count args) 1 )
    (join " " args)
    "y"))

;; This is an implementation of yes in Clojure
(defn yes []
  (while true (println (getstr *command-line-args*))))

(yes)
