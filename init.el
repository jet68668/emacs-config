(setq inferior-lisp-program "/usr/local/bin/sbcl")
(add-to-list 'load-path "~/.emacs.d/slime/")
(require 'slime-autoloads)
(slime-setup '(slime-fancy))

(setq make-backup-files nil)

;;color-theme
(add-to-list 'load-path "~/.emacs.d/color-theme/")
(require 'color-theme)
(color-theme-initialize)
(color-theme-gray30)


(global-set-key (kbd "C-x w") 'other-window)
(global-unset-key (kbd "C-x C-b"))
(global-set-key (kbd "C-x C-B") 'buffer-menu)
(global-set-key (kbd "C-x x") 'execute-extended-command)

(add-to-list 'load-path "~/.emacs.d/my-config/")
;;use latex to export pdf file in org-mode
(setq org-log-done 'time)
(load "my-org-latex")
(load "my-test")

;;ace-windows
(global-set-key (kbd "M-p") 'ace-window)

;;org tags
;;(setq org-todo-keywords
;;      '((sequence "TODO(t!)" "NEXT(n)" "WAITING(w)" "HOLD(h)" "DELAY(e)" "|" "CANCEL(c@/!)" "DONE(d@/!)")
;;	))
;;agenda
(setq org-agenda-files (quote ("~/.org/gtd-org/tasks.org")))
(global-set-key (kbd "C-c a") 'org-agenda)

(defun gtd()
  (interactive)
  (find-file "~/.org/gtd-org/tasks.org"))
;;show line num
(global-linum-mode t)
