(require :uiop)

(defvar input 
  (uiop:read-file-lines "input.txt"))

(defun get-points 
  (a b total) 

  (if 
    (char-equal b #\X) 
    (setf total 
      (+ total 1)))
  (if 
    (char-equal b #\Y) 
    (setf total 
      (+ total 2)))
  (if 
    (char-equal b #\Z) 
    (setf total 
      (+ total 3)))
  (if 
    (or 
      (and 
        (char-equal a #\A) 
        (char-equal b #\Y)) 
      (and 
        (char-equal a #\B) 
        (char-equal b #\Z)) 
      (and 
        (char-equal a #\C) 
        (char-equal b #\X))  
)
    (setf total 
      (+ total 6)))
  (if 
    (or 
      (and 
        (char-equal a #\A) 
        (char-equal b #\X)) 
      (and 
        (char-equal a #\B) 
        (char-equal b #\Y)) 
      (and 
        (char-equal a #\C) 
        (char-equal b #\Z))  
)
    (setf total 
      (+ total 3)))
total
)

(print 
  (
    (lambda 
      (i total)
      (loop 
        (when 
          (>= i 
            (length input))
          (return 0)) 
        (setf total 
          (+ total
            (get-points 
              (char 
                (nth i input) 0) 
              (char 
                (nth i input) 2) 0)))
        (terpri)
        (setf i 
          (+ i 1))
)
total
)0 0))
