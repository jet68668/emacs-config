
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
        (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(setq inferior-lisp-program "/usr/local/bin/sbcl")
(add-to-list 'load-path "~/.emacs.d/slime/")
(require 'slime-autoloads)
(slime-setup '(slime-fancy))

(setq make-backup-files nil)
(setq auto-save-default nil) 

;;color-theme
(add-to-list 'load-path "~/.emacs.d/color-theme/")
(require 'color-theme)
(color-theme-initialize)
;(color-theme-midnight)


(global-set-key (kbd "C-x w") 'other-window)
(global-unset-key (kbd "C-x C-b"))
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "C-x x") 'execute-extended-command)
(global-set-key (kbd "C-c g") 'goto-line)

(add-to-list 'load-path "~/.emacs.d/my-config/")
;;use latex to export pdf file in org-mode
(setq org-log-done 'time)
;;(load "my-org-latex")
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
;;(global-set-key (kbd "C-c f") 'projectile-find-file)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (list "~/GTD/inbox.org" "~/GTD/calender.org" "~/GTD/books.org" "~/GTD/finished.org" "~/GTD/project.org" "~/GTD/notes.org"))
 '(org-refile-targets
   (quote
    (("~/GTD/inbox.org" :level . 1)
     ("~/GTD/finished.org" :level . 1)
     ("~/GTD/calender.org" :level . 1)
     ("~/GTD/books.org" :level . 1)
     ("~/GTD/project.org" :level . 1)
     ("~/GTD/notes.org" :level . 1))))
 '(package-selected-packages
   (quote
    (counsel-projectile counsel yasnippet js2-mode ggtags company ace-window))))

;;counsel
(ivy-mode 1)
(global-set-key (kbd "C-x x") 'counsel-M-x)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c p f") 'counsel-projectile-find-file-dwim)
(global-set-key (kbd "C-x C-b") 'counsel-ibuffer)
(global-set-key (kbd "C-c p p") 'counsel-projectile-switch-project)
(global-set-key (kbd "C-x b") 'counsel-switch-buffer)
(global-set-key (kbd "C-s") 'swiper)

;;neotree
(add-to-list 'load-path "~/.emacs.d/emacs-neotree")
(require 'neotree)
(global-set-key (kbd "<f8>") 'neotree-toggle)

;;imenu
(global-set-key (kbd "<f7>") 'counsel-imenu)
(global-set-key (kbd "C-x t") 'helm-imenu-in-all-buffers)

;;highlight ()
(show-paren-mode 1)
(global-hi-lock-mode 1)

;;git-emacs
(global-set-key (kbd "C-x g") 'magit-status)

;; 4 for tab
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
(setq c-default-style "linux")
(setq c-basic-offset 4)
