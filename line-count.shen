\* Call (load "line-count.shen") *\
(set filename "somefile.txt")

(define line-count
  [] -> 0
  [X | Y] -> (+ 1 (line-count Y)) where (= X (n->string 10))
  [_ | Y] -> (line-count Y))

(print "Char Count")
(length (explode (read-file-as-string (value filename))))

(print "Word Count")
(length (read-file (value filename)))

(print "Line Count")
(line-count (explode (read-file-as-string (value filename))))

(print "Own Form Count")
(length (read-file "line-count.shen"))
