;;; penisparser -- Summary

; Replaces every word in a file with penis.

;;; Commentary:

; This is silly.

;;; Code:
(defun penis-parse ()
  "PARSE SOME PENIS ARG."
  (interactive)
  (let ((input-file (read-file-name "File to parse: ")))
    (write-string-to-file
     (mapconcat 'identity
		(mapcar
		 'parse-string
		 (get-string-from-file "text.txt"))
		"\n")
     '"penis.txt")
        (message "%s parsed" input-file)))

(defun get-string-from-file (filePath)
  "Read the contents at FILEPATH into a string."
  (with-temp-buffer
    (insert-file-contents filePath)
    (split-string (buffer-string) "\n" t)))

(defun parse-string (string)
  "Replace text in STRING with penis."
  (replace-regexp-in-string "[a-z0-9A-Z]+" "penis" string))

(defun write-string-to-file (string file)
  "Writes the STRING to a FILE."
  (with-temp-file file
    (insert string)))

;;; penisparser.el ends here
