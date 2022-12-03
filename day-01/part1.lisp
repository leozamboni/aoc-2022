(require :uiop)

(defvar input 
  (uiop:read-file-lines "input.txt"))

(defun get-sum 
  (i) 
  (if 
    (and 
      (< i 
        (list-length input)) 
      (not 
        (equal 
          (nth i input) "")))
    (+ 
      (parse-integer 
        (nth i input)) 
      (get-sum
        (+ i  1))) 0))

(defun get-next-index 
  (i) 
  (if 
    (or 
      (equal 
        (nth i input) "") 
      (> i 
        (length input))) i
    (get-next-index 
      (+ i 1))))

(print 
  (
    (lambda 
      (current_index current_sum biggest_value)
      (loop 
        (setf current_sum 
          (get-sum current_index))
        (if 
          (> current_sum biggest_value)
          (setf biggest_value current_sum))
        (when 
          (>= current_index 
            (length input))
          (return biggest_value)) 
        (setf current_index 
          (+ 
            (get-next-index 
current_index)1)))) 0 0 -1))


