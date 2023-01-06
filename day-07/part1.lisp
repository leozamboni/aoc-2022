(require :uiop)

(defvar input 
  (uiop:read-file-lines "input.txt"))

(defvar tree '("/"))
(defvar aux_tree '("/"))
(defvar last_tree)

(defvar last_index 0)
(defvar dir_index 0)

(defun get-size (str) (let ((size "")) (
  loop for str_char across str do (
    if (char-equal str_char #\space)
     (return size) 
    (setf size (concatenate 'string size (string str_char)))))size))

(defun get-dir-index (dir_name)  (
  loop for i from 0 to (- (length tree) 1) do (
    if (string-equal (nth i tree) dir_name)
     (return i))))

(defun parse-input (i) 
  (if (>= i (- (length input) 1)) i)
  (if (and (>= (length (nth i input)) 7) (string-equal (subseq (nth i input) 2 7) "cd .."))
  ;  ((lambda () 
  ; (setq last_index i)""))
  (parse-input (+ i 1))
  (if (string-equal (subseq (nth i input) 2 4) "cd") 
  ((lambda () 
  (setq last_index i)
  ; (print (subseq (nth i input) 5 (length (nth i input))))
  (get-dir-index (subseq (nth i input) 5 (length (nth i input))))))
   (if (string-equal (subseq (nth i input) 0 3) "dir") 
   ((lambda () 
   (push (subseq (nth i input) 4 (length (nth i input))) (cdr tree))
    (parse-input (+ i 1))
   ))
  (if (string-not-equal (subseq (nth i input) 2 4) "ls") 
  ((lambda () 
    (push (get-size (nth i input)) (cdr tree))
    (parse-input (+ i 1))
   ))(parse-input (+ i 1))
  )))))


;; UTIL FUNCTIONS
(defun insert-after (lst index newelt)
  (push newelt (cdr (nthcdr index lst))) 
  lst)

(defun remove-nth (list n)
  (remove-if (constantly t) list :start n :end (1+ n)))
;; -/- ;;

(setq dir_index (parse-input 0))
(setq last_tree (list tree))
(setq tree (list (nth dir_index tree)))

(parse-input (+ last_index 1))
(setq last_tree (append last_tree (list tree)))
(setq tree (list (nth dir_index tree)))
(parse-input (+ last_index 1))
(setq last_tree (append last_tree (list tree)))


(print last_tree) 

