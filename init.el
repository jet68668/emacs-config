:(setq inferior-lisp-program "/usr/local/bin/sbcl")
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
(global-set-key (kbd "C-x x") 'execute-extended-command)

(add-to-list 'load-path "~/.emacs.d/my-config/")
;;use latex to export pdf file in org-mode
(load "my-org-latex")
(load "my-test")
