
(defun switch-files()
  (interactive)
  (let ((buffer-name "*Switch GTD files*")
	(keys))
    (switch-to-buffer-other-window buffer-name)
    (add-help-text "Commend to open Files:\n\n")
    (add-help-text "i : to open inbox.org\t\t" t)
    (add-help-text "p : to open project.org\n\n" t)
    (add-help-text "n : to open notes.org\t\t" t)
    (add-help-text "\n\n----------------------------\n")
    (add-help-text "q : Abort\n\n\n\n" t)
    (shrink-window-if-larger-than-buffer)
    (beginning-of-buffer)
    (setq keys (read-char "Swich to:"))
    (open-gtd-files keys)
    (delete-other-windows)
    (kill-buffer buffer-name)))

(defun add-help-text(str &optional prop)
  (if prop
      (add-text-properties 0 2 `(face (:foreground "red")) str))
  (insert str))

(defun open-gtd-files(key)
  (cond
   ((= key ?i) (find-file "~/GTD/inbox.org"))
   ((= key ?p) (find-file "~/GTD/project.org"))
   ((= key ?n) (find-file "~/GTD/notes.org"))
   ((= key ?q) (message "Abort"))))

(global-set-key (kbd "C-c i") 'switch-files)
    
;;org agenda-files
;;(setq org-agenda-files (list "~/GTD/inbox.org" "~/GTD/calender.org" "~/GTD/books.org" "~/GTD/finished.org" "~/GTD/project.org" "~/GTD/notes.org"))

;;org refiles target
(custom-set-variables
 '(org-agenda-files
   (list
    "~/GTD/inbox.org"
    "~/GTD/calender.org"
    "~/GTD/books.org"
    "~/GTD/finished.org"
    "~/GTD/project.org"
    "~/GTD/notes.org"))
 '(org-refile-targets
   (quote
    (("~/GTD/inbox.org" :level . 1)
     ("~/GTD/finished.org" :level . 1)
     ("~/GTD/calender.org" :level . 1)
     ("~/GTD/books.org" :level . 1)
     ("~/GTD/project.org" :level . 1)
     ("~/GTD/notes.org" :level . 1)))))

;;remember instance
(global-set-key (kbd "C-c t") 'org-capture)
(setq org-capture-templates
      '(("t" "TODO" entry (file+headline "~/GTD/inbox.org" "Todo")
	 "** Task begin: %T\n %i \n %?")
	("n" "NOTE" entry (file+headline "~/GTD/notes.org" "Note")
	 "** Note add: %T\n %i\n %?")
;;       	("b" "Book" entry (file+headline "~/GTD/books.org" "Reading")
;;	 "* Reading %T\n%?%i\n")
	))


;;bind eval fun
(global-set-key (kbd "C-c C-c") 'eval-last-sexp)

;;;;htmlize
(add-to-list 'load-path "~/.emacs.d/my-config/emacs-htmlize/")
(require 'htmlize)
