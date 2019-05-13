(require 'generator)
(setq lexical-binding t)

(iter-defun exp-gen (pow)
  (let ((i 0))
    (while
      (setq i (1+ i))
      (iter-yield (expt i pow)))))

(iter-defun flt-gen ()
  (let ((i 'nil)
	(g (exp-gen 2))
	(f (lambda (n)
	     (if (= (ffloor (log n 3)) (log n 3))
		 'nil
	       't))))
    (while
	(setq i (iter-next g))
      (when (funcall f i)
	(iter-yield i)))))

(let ((g (flt-gen))
      (o 'nil))
  (dotimes (i 29)
    (setq o (iter-next g))
    (when (> i 18)
      (print o))))
