(require :uiop)

(defvar input 
  (uiop:read-file-lines "input.txt"))

(setf input 
  (nth 0 input))

(print 
  (let 
    (
      (chars))
    (loop for i from 0 to 
      (length input) do 
      (print chars)
      (when 
        (equal 
          (length chars) 4)
        (return i))
      (if 
        (not 
          (find 
            (char input i) chars))
        (setf chars 
          (append chars 
            (list 
              (char input i))))
        (
          (lambda 
            () 
            (setf chars 
              (subseq chars
                (+ 1 
                  (position 
                    (char input i) chars)) 
                (length chars)))
            (setf chars 
              (append chars 
                (list 
                  (char input i))))))))))