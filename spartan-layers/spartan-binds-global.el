;;; -*- lexical-binding: t; no-byte-compile: t; -*-

;; UNBIND ANNOYANCES

(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "M-m"))

;; TAB AUTO COMPLETION
(setq tab-always-indent 'complete) ; used by eglot for auto-completion as well

;; BETTER-DEFAULTS

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-/") 'hippie-expand)

;; REDICULOUSLY USEFUL TRAMP COMMAND

(defun spartan-tramp (x)
  "Tramp ssh to a server, optionally as root, and [optionally] store creds in .authinfo[.gpg] if Emacs 27"
  (interactive "sServer name: ")
  (if (yes-or-no-p "sudo to root? ")
    (find-file (concat "/ssh:" x "|sudo:" x ":"))
  (find-file (concat "/ssh:" x ":"))))

(defalias 'tramp 'spartan-tramp)
(global-set-key (kbd "C-c t") 'spartan-tramp)

;; MATCHING BRACKET LIKE VIM's "%"

(defun forward-or-backward-sexp (&optional arg)
  "Go to the matching parenthesis character if one is adjacent to point."
  (interactive "^p")
  (cond ((looking-at "\\s(") (forward-sexp arg))
	((looking-back "\\s)" 1) (backward-sexp arg))
	;; Now, try to succeed from inside of a bracket
	((looking-at "\\s)") (forward-char) (backward-sexp arg))
	((looking-back "\\s(" 1) (backward-char) (forward-sexp arg))))

(global-set-key (kbd "C-%") 'forward-or-backward-sexp)

;; COLLECTION OF REDICULOUSLY USEFUL EXTENSIONS

(with-eval-after-load 'crux
  (global-set-key (kbd "C-a") 'crux-move-beginning-of-line)
  (global-set-key (kbd "C-o") 'crux-smart-open-line)
  (global-set-key (kbd "C-c C-l") 'crux-duplicate-current-line-or-region)
  (global-set-key (kbd "C-c C--") 'crux-kill-whole-line)
  (global-set-key (kbd "C-c ;") 'crux-duplicate-and-comment-current-line-or-region))

;; BROWSE KILL RING

(with-eval-after-load 'browse-kill-ring
  (defalias 'kr 'browse-kill-ring)
  (global-set-key (kbd "M-y") 'browse-kill-ring))

;; GLOBAL FONT SIZE ADJUSTMENTS

(with-eval-after-load 'spartan-better-defaults
  (global-set-key (kbd "C-=") #'(lambda ()
				  (interactive)
				  (spartan-font-resizer 1)))
  (global-set-key (kbd "C--") #'(lambda ()
				  (interactive)
				  (spartan-font-resizer -1))))

;; REGEXP SEARCH

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

;; FIND FILES

(defalias 'ff 'find-name-dired)
(global-set-key (kbd "C-c pf") 'find-name-dired)

;; GREP FILES

(defalias 'rg 'rgrep)
(global-set-key (kbd "C-c psg") 'rgrep)

;; DIFF

(defalias 'ed 'ediff)
(global-set-key (kbd "C-c |") 'ediff)

;; GIT

(with-eval-after-load 'magit
  (defalias 'git 'magit)
  (global-set-key (kbd "C-c g") 'magit))

;; LINTER

(with-eval-after-load 'spartan-flymake
  (defalias 'lint 'flymake-show-diagnostics-buffer)
  (global-set-key (kbd "C-c f") 'flymake-show-diagnostics-buffer))

;; PASTEBIN

(with-eval-after-load 'spartan-webpaste
  (defalias 'pb 'webpaste-paste-buffer-or-region)
  (global-set-key (kbd "C-c C-p C-p") 'webpaste-paste-buffer-or-region))

;; DUMB TERM

(with-eval-after-load 'spartan-shell
  (defalias 'sh 'better-shell-for-current-dir)
  (global-set-key (kbd "C-c $") 'better-shell-for-current-dir))

;; VTERM

(with-eval-after-load 'spartan-vterm
  (defalias 'vt 'vterm)
  (global-set-key (kbd "C-c C-v") 'vterm)
  (global-set-key (kbd "C-c C-j") 'vterm-copy-mode)
  (global-set-key (kbd "C-c C-k") 'vterm-copy-mode-done)
  (global-set-key (kbd "C-c v") 'vterm))

;; COMPILE COMMAND

(setq compile-command "make -k ")
(global-set-key (kbd "<f5>") 'compile)

;; EXECUTE SCRIPT

(with-eval-after-load 'spartan-shell
  (global-set-key (kbd "<f6>") 'spartan-script-execute))

(provide 'spartan-binds-global)
