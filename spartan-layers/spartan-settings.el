;;; -*- lexical-binding: t; -*-

(setq-default frame-resize-pixelwise t ; support better certain window managers like ratpoison
              indent-tabs-mode nil
              tab-width 8
              fill-column 79
              gnutls-verify-error t
              gnutls-min-prime-bits 2048
              password-cache-expiry nil
              mouse-yank-at-point t
              save-interprogram-paste-before-kill t
              apropos-do-all t
              require-final-newline t
              ediff-window-setup-function 'ediff-setup-windows-plain
              backup-directory-alist
              `((".*" . ,temporary-file-directory))
              auto-save-file-name-transforms
              `((".*" ,temporary-file-directory t))
              tab-always-indent 'complete

              tramp-default-method "ssh"
              tramp-copy-size-limit nil
              tramp-use-ssh-controlmaster-options nil

              ;; I recommend the following ~/.ssh/config settings be used with the tramp settings in this cfg:
              ;;
              ;; ForwardAgent yes
              ;; AddKeysToAgent yes
              ;; ControlMaster auto
              ;; ControlPath ~/.ssh/master-%r@%h:%p
              ;; ControlPersist yes
              ;; ServerAliveInterval 10
              ;; ServerAliveCountMax 10

              tramp-default-remote-shell "/bin/bash"
              shell-file-name "/bin/bash"
              explicit-shell-file-name "/bin/bash"

              vc-follow-symlinks t
              ring-bell-function 'ignore
              browse-url-browser-function 'eww-browse-url
              ido-create-new-buffer 'always
              ido-auto-merge-work-directories-length -1
              ido-enable-flex-matching t
              ido-use-filename-at-point 'guess
              ido-use-faces nil)

(provide 'spartan-settings)
