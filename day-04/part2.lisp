(require :uiop)

(defvar input 
  (uiop:read-file-lines "input.txt"))

(defun check-range 
  (fl fr sl sr)
  (or 
    (and
      (<= 
        (parse-integer fl) 
        (parse-integer sl))
      (>= 
        (parse-integer fr) 
        (parse-integer sl)))
    (and
      (>= 
        (parse-integer fr) 
        (parse-integer sr))
      (<= 
        (parse-integer fl) 
        (parse-integer sr)))
    (and
      (>= 
        (parse-integer sr) 
        (parse-integer fr))
      (<= 
        (parse-integer sl) 
        (parse-integer fr)))
    (and
      (<= 
        (parse-integer sl) 
        (parse-integer fl))
      (>= 
        (parse-integer sr) 
        (parse-integer fl)))))

(defun parse-value
  (str_line start_index) 
  (let 
    ( 
      (value ""))
    (loop for index from start_index to 
      (- 
        (length str_line) 1) do
      (when 
        (or 
          (char-equal 
            (char str_line index) #\-)
          (char-equal 
            (char str_line index) #\,))
        (return value)) 
      (setf value 
        (concatenate 'string value 
          (string 
            (char str_line index)))))value))

(defun parse-line
  (str_line) 
  (let 
    (
      (fl "")
      (fr "")
      (sl "")
      (sr ""))
    (setf fl 
      (parse-value str_line 0))
    (setf fr 
      (parse-value str_line 
        (+ 
          (length fl) 1)))
    (setf sl 
      (parse-value str_line 
        (+ 
          (length fr) 
          (length fl) 2)))
    (setf sr 
      (parse-value str_line 
        (+ 
          (length fr) 
          (length fl) 
          (length sl) 3)))
    (list fl fr sl sr)))

(print 
  (
    (lambda 
      () 
      (let 
        (
          (total 0))
        (loop for line in input do 
          (let 
            (
              (line_values 
                (parse-line line))) 
            (if 
              (and
                (check-range 
                  (nth 0 line_values) 
                  (nth 1 line_values) 
                  (nth 2 line_values) 
                  (nth 3 line_values)) 
                (print line_values))
              (setf total 
                (+ total 1)))))total))))

