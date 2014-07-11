#!/bin/sh
# -*- mode: shell-script -*-
#
# org-wk-export-to-wiki files with org-mode
#
DIR=`pwd`
FILES=""

for i in $@; do
    FILES="$FILES \"$i\""
done

emacs -Q --batch \
    --eval "(progn
     (add-to-list 'load-path (expand-file-name \"~/.emacs.d/el-get/repo/org-mode/lisp/\"))
     (add-to-list 'load-path (expand-file-name \"~/.emacs.d/el-get/repo/ox-wk/\"))
     (require 'org)(require 'ox-wk)
     (mapc (lambda (file)
            (find-file (expand-file-name file \"$DIR\"))
            (org-wk-export-to-wiki)
            (kill-buffer)) '($FILES)))" 2>&1
