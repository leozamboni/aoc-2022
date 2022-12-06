(require :uiop)

(defvar input 
  (uiop:read-file-lines "input.txt"))

(setf input 
  (nthcdr 10 input))

(defvar stacks  
  (list
    (list #\s #\t #\h #\f #\w #\r)
    (list #\s #\g #\d #\q #\w)
    (list #\b #\t #\w)
    (list #\d #\r #\w #\t #\n #\q #\z #\j)
    (list #\f #\b #\h #\g #\l #\v #\t #\z)
    (list #\l #\p #\t #\c #\v #\b #\s #\g)
    (list #\z #\b #\r #\t #\w #\g #\p)
    (list #\n #\g #\m #\t #\c #\j #\r)
    (list #\l #\g #\b #\w)))

(defun parse-value
  (str_line start_index) 
  (let 
    ( 
      (value ""))
    (loop for index from start_index to 
      (- 
        (length str_line) 1) do
      (when 
        (char-equal 
          (char str_line index) #\space)
        (return value)) 
      (setf value 
        (concatenate 'string value 
          (string 
            (char str_line index)))))value))

(defun parse-line
  (str_line) 
  (let 
    (
      (move "")
      (from "")
      (to ""))
    (setf move 
      (parse-value str_line 
        (length "move ")))
    (setf from 
      (parse-value str_line 
        (+ 
          (length move) 
          (length "move  from "))))
    (setf to 
      (parse-value str_line 
        (+ 
          (length move) 
          (length from) 
          (length "move  from  to "))))
    (list move from to)))

(defun make-move 
  (move from to) 
  (setf 
    (nth 
      (- to 1) stacks) 
    (append 
      (nth 
        (- to 1) stacks) 
      (reverse 
        (nthcdr 
          (- 
            (length 
              (nth 
                (- from 1) stacks)) move) 
          (nth 
            (- from 1) stacks)))))
  (setf 
    (nth 
      (- from 1) stacks) 
    (butlast 
      (nth 
        (- from 1) stacks) move)))

(loop for line in input do 
  (let 
    (
      (vals 
        (parse-line line)))
    (make-move 
      (parse-integer 
        (nth 0 vals)) 
      (parse-integer 
        (nth 1 vals)) 
      (parse-integer 
        (nth 2 vals)))))

(print 
  (string-upcase
    (let 
      (
        (letters ""))
      (loop for stack in stacks do 
        (setf letters 
          (concatenate 'string  letters
            (string 
              (nth 0 
                (last stack))))))letters)))