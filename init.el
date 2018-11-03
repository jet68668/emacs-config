
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq inferior-lisp-program "/usr/local/bin/sbcl")
(add-to-list 'load-path "~/.emacs.d/slime/")
(require 'slime-autoloads)
(slime-setup '(slime-fancy))

(setq make-backup-files nil)
(setq auto-save-default nil) 

;;color-theme
;;(add-to-list 'load-path "~/.emacs.d/color-theme/")
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-gray30)


(global-set-key (kbd "C-x w") 'other-window)
(global-unset-key (kbd "C-x C-b"))
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "C-x x") 'execute-extended-command)
(global-set-key (kbd "C-x g") 'goto-line)

(add-to-list 'load-path "~/.emacs.d/my-config/")
;;use latex to export pdf file in org-mode
(setq org-log-done 'time)
(load "my-org-latex")
(load "my-test")

;;ace-windows
(global-set-key (kbd "M-p") 'ace-window)

;;org tags
(setq org-todo-keywords
      '((sequence "TODO(t!)" "NEXT(n)" "WAITING(w)" "HOLD(h)" "DELAY(e)" "|" "CANCEL(c@/!)" "DONE(d@/!)")
	))
(global-set-key (kbd "C-c a") 'org-agenda)

;;show line num
(global-linum-mode t)

;;company code complete
(add-hook 'after-init-hook 'global-company-mode)

;;jump to tags
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
	      (ggtags-mode 1))))
;;tag-list imenu-case
;;(defun try-to-add-imenu ()
;;  (condition-case nil (imenu-add-to-menubar "myImenu") (error nil)))
;; (add-hook 'font-lock-mode-hook 'try-to-add-imenu)

;;tag-list speedbar-case
(add-to-list 'load-path "~/.emacs.d/sr-speedbar/")
(require 'sr-speedbar)
(global-set-key (kbd "C-x t") 'taglist-open)

(defun taglist-open()
  (interactive)
  (if (sr-speedbar-exist-p)
      (sr-speedbar-close)
    (progn
      (sr-speedbar-open)
      (sr-speedbar-select-window))))

;;go-mode

(add-to-list 'load-path "~/.emacs.d/go-mode")
(require 'go-mode-autoloads)

;; reload buffer
(defun reload()
  (interactive)
  (revert-buffer))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;goto end of buffer
(global-set-key (kbd "C-c e") 'end-of-buffer)
(global-set-key (kbd "C-c s") 'beginning-of-buffer)

;;projectile
(add-to-list 'load-path "~/.emacs.d/projectile/")
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
(global-set-key (kbd "C-c f") 'projectile-find-file)
