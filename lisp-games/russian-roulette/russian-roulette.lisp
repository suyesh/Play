(defparameter *random-state* (make-random-state t))

(princ "This is a game of Russian Roulette")
(fresh-line)
(princ "Here is a revolver.")
(fresh-line)
(princ "Type '1' to spin chamber and pull trigger")
(fresh-line)
(princ "Type '2' to give up.")
(fresh-line)


(defun play-game ()
  (labels ((prompt (turn-number)
             (princ turn-number)
             (princ " Go? ")
             (let ((answer (read)))
               (cond ((eq answer 1) t)
                     ((eq answer 2) nil)
                     (t (progn (princ "That answer is not valid, expected '1' or '2'")
                               (prompt))))))
           (take-turn (n)
             (if (prompt n)
                 (if (eq (random 6) 0)
                     (progn (princ "     BANG!!!   You're dead!")
                            (fresh-line)
                            (princ "Condolences will be sent to your relatives.")
                            (return-from play-game))
                     (progn (princ "- CLICK - ")
                            (fresh-line)))
                 (progn (princ "You may have gained your life, but you lost the game, comrade. HAR! HAR! HAR!")
                        (fresh-line)
                        (return-from play-game)))))
    (loop for i from 1 to 10
          do (take-turn i))
    (princ "Congratulations, you survived.")
    (fresh-line)
    (princ "Here, have some vodka, and lets play again >:D")))
                 
(play-game)