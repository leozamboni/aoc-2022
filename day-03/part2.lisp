(require :uiop)

(defvar input 
  (uiop:read-file-lines "input.txt"))

(defvar lower_case_priorities 
'
  (
    (#\a 1)
    (#\b 2)
    (#\c 3)
    (#\d 4)
    (#\e 5)
    (#\f 6)
    (#\g 7)
    (#\h 8)
    (#\i 9)
    (#\j 10)
    (#\k 11)
    (#\l 12)
    (#\m 13)
    (#\n 14)
    (#\o 15)
    (#\p 16)
    (#\q 17)
    (#\r 18)
    (#\s 19)
    (#\t 20)
    (#\u 21)
    (#\v 22)
    (#\w 23)
    (#\x 24)
    (#\y 25)
    (#\z 26)
    (#\A 27)
    (#\B 28)
    (#\C 29)
    (#\D 30)
    (#\E 31)
    (#\F 32)
    (#\G 33)
    (#\H 34)
    (#\I 35)
    (#\J 36)
    (#\K 37)
    (#\L 38)
    (#\M 39)
    (#\N 40)
    (#\O 41)
    (#\P 42)
    (#\Q 43)
    (#\R 44)
    (#\S 45)
    (#\T 46)
    (#\U 47)
    (#\V 48)
    (#\W 49)
    (#\X 50)
    (#\Y 51)
    (#\Z 52)))

(defun find-letter 
  (str_list) 
  (let 
    (char)
    (loop for c_str_1 across 
      (nth 0 str_list) do 
      (loop for c_str_2 across
        (nth 1 str_list) do 
        (if
          (equal c_str_1 c_str_2) 
          (loop for c_str_3 across
            (nth 2 str_list) do 
            (if
              (equal c_str_2 c_str_3)
              (setf char c_str_3))))))char))

(defun get-letter 
  (input_line) 
  (find-letter input_line))

(defun get-prioritie
  (letter) 
  (loop for prioritie_item in lower_case_priorities do
    (if 
      (equal letter 
        (nth 0 prioritie_item))
      (return 
        (nth 1 prioritie_item))
)))

(print 
  (
    (lambda 
      (total) 
      (loop for i from 0 to 
        (- 
          (length input) 1) do
        (setf total 
          (+ total 
            (get-prioritie 
              (get-letter 
                (list 
                  (nth i input) 
                  (nth 
                    (+ i 1) input) 
                  (nth 
                    (+ i 2) input))))))
        (setq i 
          (+ i 2)))total)0))
