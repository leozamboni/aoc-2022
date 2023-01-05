(require :uiop)


(defvar input 
  (uiop:read-file-lines "input.txt"))

;; ("/" 0 ("a" 0 ("e" 0 (584))(29116)(2557)(62596))(14848514)(8504156)("d" 0))

(defvar tree '("/" 0))

(defun parse-size (str) (let ((size "")) (
  loop for str_char across str do (
    if (char-equal str_char #\.)
     (return size) 
    (if (char-not-equal str_char #\space)
     (setf size (concatenate 'string size (string str_char))))))size))

(loop for i from 0 to (- (length input) 1) do (
  if (and (>= (length (nth i input)) 7) (string-equal (subseq (nth i input) 2 7) "cd ..") )
  (print (nth i input))
  (if (string-equal (subseq (nth i input) 2 4) "cd") 
  (print (nth i input))
  (push (parse-size (nth i input)) (cdr tree))
  )
))

(print tree)
;; (defun make-tree (item)
;;    "it creates a new node with item."
;;    (cons (cons item nil) nil)
;; )

;; (defun first-child (tree)
;;    (if (null tree)
;;       nil
;;       (cdr (car tree))
;;    )
;; )

;; (defun next-sibling (tree)
;;    (cdr tree)
;; )

;; (defun data (tree)
;;    (car (car tree))
;; )

;; (defun add-child (tree child)
;;    (setf (car tree) (append (car tree) child))
;;    tree
;; )

;; (defvar tr '((1 2 (3 4 5) ((7 8) (7 8 9)))))
;; (defvar mytree (make-tree 10))

;; (write (data mytree))
;; (terpri)
;; (write (first-child tr))
;; (terpri)
;; (defvar newtree (add-child tr mytree))
;; (terpri)
;; (write newtree)