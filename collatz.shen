(define even?
  X -> true where (integer? (/ X 2))
  _ -> false)

(define range
  [S E] -> [] where (> S E)
  [S E] -> (cons S (range [(+ S 1) E])))

(define distinct
  [] -> []
  [X | Y] -> (distinct Y) where (element? X Y)
  [X | Y] -> [X | (distinct Y)])

(define prune
  [F []] -> []
  [F [X | Y]] -> (prune [F Y]) where (F X)
  [F [X | Y]] -> (cons X (prune [F Y])))



(define collatz
  1 -> [1]
  X -> (cons X (collatz (/ X 2))) where (even? X)
  Y -> (cons Y (collatz (+ (* 3 Y) 1))))

(define ztalloc
  N -> (map reverse (map collatz (range [1 N]))))

(define slice-to-graph
  [] -> []
  X -> (cons (distinct (map head X))
			 (slice-to-graph (prune [empty? (map tail X)]))))

(ztalloc 5)
(slice-to-graph (ztalloc 5))
(slice-to-graph (ztalloc 50))
