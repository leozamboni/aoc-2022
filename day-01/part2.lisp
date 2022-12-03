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
      (index total top1 top2 top3)
      (loop 
        (setf total 
          (get-sum index))
        (if 
          (> total top1)
          (
            (lambda 
              () 
              (setf top3 top2)
              (setf top2 top1)
              (setf top1 total)))
          (if 
            (> total top2) 
            (
              (lambda 
                () 
                (setf top3 top2)
                (setf top2 total)))
            (if 

              (> total top3) 

              (
                (lambda 
                  () 
                  (setf top3 total))))))
        (when 
          (>= index 
            (length input))
          (return 
            (+ top1 top2 top3))) 
        (setf index 
          (+ 
            (get-next-index 
index)1)))) 0 0 -1 -1 -1))