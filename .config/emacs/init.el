(require 'package)
(setq package-archives '(("org"."https://orgmode.org/elpa/")
			 ("gnu"."https://elpa.gnu.org/packages/")
			 ("melpa"."https://melpa.org/packages/")))

;; initialize built-in package management
(package-initialize)

;; update packages list if we are on a new install
(unless package-archive-contents (package-refresh-contents))

(setq my-package-list '(use-package
			no-littering
			vertico
			marginalia
			orderless
			magit
			gruvbox-theme))

;; programmatically install/ensure installed
;; pkgs in your personal list
(dolist (package my-package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; disable backup files
(setq make-backup-files nil)
;; disable customize
(setq custom-file "/dev/null")

;; menus/ui
(setq inhibit-startup-screen t)
(column-number-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; typing
(electric-pair-mode 1)

;; scrolling
(setq scroll-up-aggressively nil
      scroll-down-aggressively nil
      scroll-conservatively 101)
(setq scroll-step 1)
(setq scroll-margin 10)

;; vertico config
(use-package vertico
  :ensure nil
  :custom (vertico-count 15)
  :bind (:map vertico-map
        ("C-n". vertico-next)
        ("C-p". vertico-previous))
  :init (vertico-mode t))

;; orderless config
(use-package orderless
  :config (setq completion-styles '(orderless partial-completion basic)
		completion-category-defaults nil
		completion-category-overrides '((file(styles.(partial-completion))))))

;; set background opacity
(set-frame-parameter (selected-frame) 'alpha '(85 . 85))
(add-to-list 'default-frame-alist '(alpha . (85 . 85)))
(set-frame-parameter nil 'alpha-background 85)
(add-to-list 'default-frame-alist '(alpha-background . 85))

;; set theme
(load-theme 'gruvbox-dark-hard t)

;; set font
(set-frame-font "Cascadia Code " nil t)
(set-face-attribute 'default nil :height 212)
