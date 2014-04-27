(when (> emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d"))
;; load-pathの追加関数
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))
;; load-pathに追加するフォルダ
;; 2つ以上フォルダを指定する場合の引数 => (add-to-load-path "elisp" "xxx" "xxx")
(add-to-load-path "elisp" "inits" "el-get")

(setq org-list-allow-alphabetical nil)

(require 'org)
;;(require 'ob-exp)
(require 'ox)
(require 'ox-md)
