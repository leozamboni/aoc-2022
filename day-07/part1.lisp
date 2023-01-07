(require :uiop)

(defvar input 
  (uiop:read-file-lines "input.txt"))

(defvar tree '("/"))
(defvar array_dir)
(defvar array_dir_index 0)

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

(defun parse-input (i tree) 
  (if (>= i (- (length input) 1)) i)
  (if (and (>= (length (nth i input)) 7) (string-equal (subseq (nth i input) 2 7) "cd .."))
   ((lambda () 
  (setq array_dir_index (- array_dir_index 1))
  (parse-input (+ i 1) tree)
  ))
  (if (string-equal (subseq (nth i input) 2 4) "cd") 
  ((lambda () 
   (setq array_dir_index (+ array_dir_index 1))
  (setq last_index i)
  ; (print (subseq (nth i input) 5 (length (nth i input))))
  (get-dir-index (subseq (nth i input) 5 (length (nth i input))))))
   (if (string-equal (subseq (nth i input) 0 3) "dir") 
   ((lambda () 
   (push (subseq (nth i input) 4 (length (nth i input))) (cdr tree))
    (parse-input (+ i 1) tree)
   ))
  (if (string-not-equal (subseq (nth i input) 2 4) "ls") 
  ((lambda () 
    (push (get-size (nth i input)) (cdr tree))
    (parse-input (+ i 1) tree)
   ))(parse-input (+ i 1) tree)
  )))))


;; UTIL FUNCTIONS
(defun insert-after (lst index newelt)
  (push newelt (cdr (nthcdr index lst))) 
  lst)

(defun remove-nth (list n)
  (remove-if (constantly t) list :start n :end (1+ n)))
;; -/- ;;

(setq dir_index (parse-input 0 tree))
(setq array_dir (list tree))

; (print (nth (- array_dir_index 1) array_dir))
; (print (remove-nth (nth (- array_dir_index 1) array_dir) dir_index))

(setq tree (list (nth dir_index tree)))

(parse-input (+ last_index 1) tree)
(setq array_dir (append array_dir (list tree)))

(setq tree (list (nth dir_index tree)))
(parse-input (+ last_index 1) tree)
(setq array_dir (append array_dir (list tree)))

(setq tree (list (nth dir_index tree)))
(parse-input (+ last_index 1) tree)
; (setq array_dir (append array_dir (list tree)))


; (setf (nth array_dir_index array_dir) (remove-nth (nth array_dir_index array_dir) dir_index))
; (print (insert-after (nth array_dir_index array_dir) (- dir_index 1) (nth (+ array_dir_index 1) array_dir)))

(print array_dir)