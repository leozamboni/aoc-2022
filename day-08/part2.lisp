(require :uiop)

(defvar input 
  (uiop:read-file-lines "input.txt"))

(defun check-if-top-is-visible (curr_index curr_str_index val count) 
    (setq count (+ count 1)) 
    (if (or (>= (digit-char-p (char (nth curr_index input) curr_str_index)) val) (equal curr_index 0))
        count
    (check-if-top-is-visible (- curr_index 1) curr_str_index val count)
))

(defun check-if-bottom-is-visible (curr_index curr_str_index val count) 
    (setq count (+ count 1)) 
    (if (or (>= (digit-char-p (char (nth curr_index input) curr_str_index)) val) (equal curr_index (- (length input) 1)))
        count
    (check-if-bottom-is-visible (+ curr_index 1) curr_str_index val count)
))

(defun check-if-left-is-visible (curr_str curr_str_index val count)  
    (setq count (+ count 1)) 
    (if (or (>= (digit-char-p (char curr_str curr_str_index)) val) (equal curr_str_index 0))
        count
    (check-if-left-is-visible curr_str (- curr_str_index 1) val count)
))

(defun check-if-right-is-visible (curr_str curr_str_index val count)  
    (setq count (+ count 1)) 
    (if (or (>= (digit-char-p (char curr_str curr_str_index)) val) (equal curr_str_index (- (length curr_str) 1)))
        count
    (check-if-right-is-visible curr_str (+ curr_str_index 1) val count)
))

(let (
    (max 0)
    ) 
(loop for curr_index from 1 to (- (length input) 2) do 
    (let (
        (curr_str (nth curr_index input))) (
    loop for curr_str_index from 1 to (- (length curr_str) 2) do 
    (let ( 
        (top 0)
        (left 0)
        (right 0)
        (bottom 0)
        ) 
        (setq top (check-if-top-is-visible (- curr_index 1) curr_str_index (digit-char-p (char curr_str curr_str_index)) 0))
        (setq left (check-if-left-is-visible curr_str (- curr_str_index 1) (digit-char-p (char curr_str curr_str_index)) 0))
        (setq right (check-if-right-is-visible curr_str (+ curr_str_index 1) (digit-char-p (char curr_str curr_str_index)) 0))
        (setq bottom (check-if-bottom-is-visible (+ curr_index 1) curr_str_index (digit-char-p (char curr_str curr_str_index)) 0))
        (if (> (* top left right bottom) max)
        (setq max (* top left right bottom))
        ))))) (print max))