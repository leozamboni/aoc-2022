(require :uiop)

(defvar input 
  (uiop:read-file-lines "input.txt"))
  
; WTF this puzzle is so weird  
(defun get-points 
  (move total) 

  (if 
    (equal move "A X") 
    (setf total 
      (+ total 
        (+ 0 3))))
  (if 
    (equal move "A Y") 
    (setf total 
      (+ total 
        (+ 3 1))))
  (if 
    (equal move "A Z") 
    (setf total 
      (+ total 
        (+ 6 2))))
  (if 
    (equal move "B X") 
    (setf total 
      (+ total 
        (+ 0 1))))
  (if 
    (equal move "B Y") 
    (setf total 
      (+ total 
        (+ 3 2))))
  (if 
    (equal move "B Z") 
    (setf total 
      (+ total 
        (+ 6 3))))
  (if 
    (equal move "C X") 
    (setf total 
      (+ total 
        (+ 0 2))))
  (if 
    (equal move "C Y") 
    (setf total 
      (+ total 
        (+ 3 3))))
  (if 
    (equal move "C Z") 
    (setf total 
      (+ total 
        (+ 6 1))))
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
              (nth i input) 0)))
        (setf i 
          (+ i 1))
)
total
)0 0))
