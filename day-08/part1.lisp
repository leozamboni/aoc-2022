(require :uiop)

(defvar input 
  (uiop:read-file-lines "input.txt"))

(defun check-if-top-is-visible (curr_index curr_str_index val)  (
    loop for new_index from 0 to (- curr_index 1) do 
    (if (>= (digit-char-p (char (nth new_index input) curr_str_index)) val)
        (return NIL)
    )
   (if (equal new_index  (- curr_index 1)) (return T))
))

(defun check-if-bottom-is-visible (curr_index curr_str_index val) (
    loop for new_index from (+ curr_index 1) to (- (length input) 1) do 
    (if (>= (digit-char-p (char (nth new_index input) curr_str_index)) val)
        (return NIL)
    )
    (if (equal new_index (- (length input) 1)) (return T))
))

(defun check-if-left-is-visible (curr_str curr_str_index val)  (
    loop for new_index from 0 to (- curr_str_index 1) do (
        if (>= (digit-char-p (char curr_str new_index)) val)
        (return NIL)
    )
    (if (equal new_index (- curr_str_index 1)) (return T))
))

(defun check-if-right-is-visible (curr_str curr_str_index val) (
    loop for new_index from (+ curr_str_index 1)  to (- (length curr_str) 1) do (
        if (>= (digit-char-p (char curr_str new_index)) val)
        (return NIL)
    )
    (if (equal new_index (- (length curr_str) 1)) (return T))
))

(let ((count 0)) 
(loop for curr_index from 1 to (- (length input) 2) do 
    (let (
        (curr_str (nth curr_index input))) (
    loop for curr_str_index from 1 to (- (length curr_str) 2) do 
    (let ( 
        (top NIL)
        (bottom NIL)
        (left NIL)
        (right NIL)
        ) 
        (setq top (check-if-top-is-visible curr_index curr_str_index (digit-char-p (char curr_str curr_str_index))))
        (setq bottom (check-if-bottom-is-visible curr_index curr_str_index (digit-char-p (char curr_str curr_str_index))))
        (setq left (check-if-left-is-visible curr_str curr_str_index (digit-char-p (char curr_str curr_str_index))))
        (setq right (check-if-right-is-visible curr_str curr_str_index (digit-char-p (char curr_str curr_str_index))))
        (if (or top bottom left right)
        ((lambda () (setq count (+ count 1))))
        ))))) (print (+ count  (+ (* (length input ) 2) (* (- (length (nth 0 input)) 2) 2)))))