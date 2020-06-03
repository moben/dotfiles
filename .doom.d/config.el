;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; For changing config based on the type of machine (personal/company)
(use-package! f)

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Benedikt Morbach"
      user-mail-address (if (f-exists? "/etc/exasol/")
                            "benedikt.morbach@exasol.com"
                          "benedikt.morbach@googlemail.com"))

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Notes/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; Enable deferred compilation for each loaded .el/.elc file
(setq comp-deferred-compilation t)

; Default to clangd
; See https://github.com/hlissner/doom-emacs/issues/2689
(after! lsp-clients
  (set-lsp-priority! 'clangd 1))  ; ccls has priority 0

; From https://eklitzke.org/smarter-emacs-clang-format
(defun haozeke/clang-format-buffer-conditional ()
(interactive)
  "Reformat buffer if .clang-format exists in the projectile root."
  (when (f-exists? (expand-file-name ".clang-format" (projectile-project-root)))
    (+format/buffer)))

; The interactive thing is REQUIRED
(defun haozeke/clang-format-buffer-smart-on-save ()
(interactive)
  "Add auto-save hook for clang-format-buffer-smart."
  (add-hook 'before-save-hook 'haozeke/clang-format-buffer-conditional nil t))
; This is a doom-emacs convinience macro
(add-hook! (c-mode c++-mode cc-mode) #'haozeke/clang-format-buffer-smart-on-save)
