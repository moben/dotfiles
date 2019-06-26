;; Configure package.el to include MELPA.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Ensure that use-package is installed.
;;
;; If use-package isn't already installed, it's extremely likely that this is a
;; fresh installation! So we'll want to update the package repository and
;; install use-package
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;; Automatically install any specified packages
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Always compile packages, and use the newest version available.
(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

;; Automatically update packages
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; Move automatically generated stuff to a different file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file :noerror)

;; load hrs' sensible-defaults
;; TODO: revisit backup file thingy
(load-file(expand-file-name "sensible-defaults.el" user-emacs-directory))
(sensible-defaults/use-all-keybindings)
(sensible-defaults/backup-to-temp-directory)


;; === DATA ===

;; Set personal information
(setq user-full-name "Benedikt Morbach"
      user-mail-address "benedikt.morbach@googlemail.com")


;; === UI ===

;; No delay on printing key combinations

(setq echo-keystrokes 0.01)

;; No window chrome
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode -1)

;; Apply a theme

(use-package zenburn-theme
  :config
  (load-theme 'zenburn t))

;; make sure the theme is applied when emacs is started via the daemon
(defun hrs/apply-theme ()
  "Apply the `naysayer' theme."
  (interactive)
  (load-theme 'naysayer t))

(if (daemonp)
  (add-hook 'after-make-frame-functions
            (lambda (frame)
              (with-selected-frame frame (hrs/apply-theme))))
  (hrs/apply-theme))

;; hightlight the current line
(global-hl-line-mode)

;; test new theme https://github.com/nickav/naysayer-theme.el
(load-file (expand-file-name "naysayer-theme.el" user-emacs-directory))
(load-theme 'naysayer)

;; highlight uncommited changes
(use-package diff-hl
  :config
  (add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
  (add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode))
