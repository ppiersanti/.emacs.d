(deftheme gon
  "Created 2017-11-24.")

(custom-theme-set-variables
 'gon
 '(ansi-color-faces-vector [default default default italic underline success warning error])
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(cider-repl-use-pretty-printing t)
 '(cua-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (flycheck-clojure flycheck smart-mode-line-powerline-theme smart-mode-line ivy-rich use-package helm flx dracula-theme bm magit lispy web-mode neotree parinfer kibit-helper cloc ac-cider undo-tree smex projectile paxedit markdown-mode groovy-mode git-gutter company clojure-mode-extra-font-locking clj-refactor cider-eval-sexp-fu auto-highlight-symbol aggressive-indent adoc-mode)))
 '(sml/mode-width (quote (if (eq (powerline-current-separator) (quote arrow)) (quote right) (quote full))))
 '(sml/pos-id-separator (quote (quote ("" (:propertize " " face powerline-active1) (:eval (propertize " " (quote display) (funcall (intern (format "powerline-%s-%s" (powerline-current-separator) (car powerline-default-separator-dir))) (quote powerline-active1) (quote powerline-active2)))) (:propertize " " face powerline-active2)))))
 '(sml/pos-minor-modes-separator (quote (quote ("" (:propertize " " face powerline-active1) (:eval (propertize " " (quote display) (funcall (intern (format "powerline-%s-%s" (powerline-current-separator) (cdr powerline-default-separator-dir))) (quote powerline-active1) (quote sml/global)))) (:propertize " " face sml/global)))))
 '(sml/pre-id-separator (quote (quote ("" (:propertize " " face sml/global) (:eval (propertize " " (quote display) (funcall (intern (format "powerline-%s-%s" (powerline-current-separator) (car powerline-default-separator-dir))) (quote sml/global) (quote powerline-active1)))) (:propertize " " face powerline-active1)))))
 '(sml/pre-minor-modes-separator (quote (quote ("" (:propertize " " face powerline-active2) (:eval (propertize " " (quote display) (funcall (intern (format "powerline-%s-%s" (powerline-current-separator) (cdr powerline-default-separator-dir))) (quote powerline-active2) (quote powerline-active1)))) (:propertize " " face powerline-active1)))))
 '(sml/pre-modes-separator (quote (propertize " " (quote face) (quote sml/modes))))
 '(custom-safe-themes (quote ("4939c82993d7b67a63c5fff3339946209dec7f857842b689d7f94fcbb3097f12" "42a271e747d9a7d03fcaa7041fef43563fb8ce0320e6e1373869aa8171cec8d9" "a4fcd165b62dd763638cfa21ac27dedc07c8703e3466b155293f597b0063936e" "d62d23da24aacd68839ae9f1e5e1e3a3516b6ecf990f6e9b27c791c68837c500" "f131a168e3b346a9ce44c8b88779fe3d6ab38053951f4559e28384b10a562f8e" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "b9e9ba5aeedcc5ba8be99f1cc9301f6679912910ff92fdf7980929c2fc83ab4d" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" default))))

(custom-theme-set-faces
 'gon
 '(cursor ((((class color) (min-colors 89)) (:background "#ccccc7"))))
 '(ffap ((((class color) (min-colors 89)) (:foreground "#b6b6b2"))))
 '(fringe ((((class color) (min-colors 89)) (:background "#282a36" :foreground "#b6b6b2"))))
 '(highlight ((((class color) (min-colors 89)) (:foreground "#ccccc7" :background "#464752"))))
 '(hl-line ((((class color) (min-colors 89)) (:background "#44475a"))))
 '(lazy-highlight ((((class color) (min-colors 89)) (:foreground "#e2e2dc" :background "#464752"))))
 '(link ((((class color) (min-colors 89)) (:foreground "#8be9fd" :underline t))))
 '(minibuffer-prompt ((((class color) (min-colors 89)) (:bold t :foreground "#ff79c6"))))
 '(region ((((class color) (min-colors 89)) (:background "#f1fa8c" :foreground "#282a36"))))
 '(show-paren-match ((((class color) (min-colors 89)) (:background "#ffb86c"))))
 '(trailing-whitespace ((((class color) (min-colors 89)) :foreground nil :background "#ffb86c")))
 '(vertical-border ((((class color) (min-colors 89)) (:foreground "#373844"))))
 '(warning ((((class color) (min-colors 89)) (:foreground "#ffb86c"))))
 '(font-lock-builtin-face ((((class color) (min-colors 89)) (:foreground "#ffb86c"))))
 '(font-lock-comment-face ((((class color) (min-colors 89)) (:foreground "#6272a4"))))
 '(font-lock-constant-face ((((class color) (min-colors 89)) (:foreground "#8be9fd"))))
 '(font-lock-doc-face ((((class color) (min-colors 89)) (:foreground "#6272a4"))))
 '(font-lock-function-name-face ((((class color) (min-colors 89)) (:foreground "#50fa7b" :bold t))))
 '(font-lock-keyword-face ((((class color) (min-colors 89)) (:bold ((class color) (min-colors 89)) :foreground "#ff79c6"))))
 '(font-lock-negation-char-face ((((class color) (min-colors 89)) (:foreground "#8be9fd"))))
 '(font-lock-string-face ((((class color) (min-colors 89)) (:foreground "#f1fa8c"))))
 '(font-lock-type-face ((((class color) (min-colors 89)) (:foreground "#bd93f9"))))
 '(font-lock-variable-name-face ((((class color) (min-colors 89)) (:foreground "#f8f8f2"))))
 '(font-lock-warning-face ((((class color) (min-colors 89)) (:foreground "#ffb86c" :background "#373844"))))
 '(company-echo-common ((((class color) (min-colors 89)) (:foreground "#282a36" :background "#f8f8f2"))))
 '(company-preview ((((class color) (min-colors 89)) (:background "#282a36" :foreground "#0189cc"))))
 '(company-preview-common ((((class color) (min-colors 89)) (:foreground "#373844" :foreground "#ccccc7"))))
 '(company-preview-search ((((class color) (min-colors 89)) (:foreground "#bd93f9" :background "#282a36"))))
 '(company-scrollbar-bg ((((class color) (min-colors 89)) (:background "#464752"))))
 '(company-scrollbar-fg ((((class color) (min-colors 89)) (:foreground "#ff79c6"))))
 '(company-template-field ((((class color) (min-colors 89)) (:inherit region))))
 '(company-tooltip ((((class color) (min-colors 89)) (:foreground "#e2e2dc" :background "#282a36" :bold t))))
 '(company-tooltip-annotation ((((class color) (min-colors 89)) (:foreground "#8be9fd"))))
 '(company-tooltip-common ((((class color) (min-colors 89)) (:foreground "#ccccc7"))))
 '(company-tooltip-common-selection ((((class color) (min-colors 89)) (:foreground "#f1fa8c"))))
 '(company-tooltip-mouse ((((class color) (min-colors 89)) (:inherit highlight))))
 '(company-tooltip-selection ((((class color) (min-colors 89)) (:background "#464752" :foreground "#ccccc7"))))
 '(ido-first-match ((((class color) (min-colors 89)) (:foreground "#ff79c6" :bold t))))
 '(ido-only-match ((((class color) (min-colors 89)) (:foreground "#ffb86c"))))
 '(ido-subdir ((((class color) (min-colors 89)) (:foreground "#ffb86c"))))
 '(isearch ((((class color) (min-colors 89)) (:bold t :foreground "#ffb86c" :background "#464752"))))
 '(isearch-fail ((((class color) (min-colors 89)) (:foreground "#282a36" :background "#ffb86c"))))
 '(mode-line ((t :foreground "black" :background "grey85" :box (:line-width -1 :color "white"))))
 '(mode-line-inactive ((((background dark)) :foreground "grey20" :background "grey85" :slant italic :box (:line-width -3 :color "black")) (((background light)) :foreground "grey20" :background "grey85" :slant italic :box (:line-width -2 :color "white"))))
 '(org-agenda-date ((((class color) (min-colors 89)) (:foreground "#8be9fd" :underline nil))))
 '(org-agenda-dimmed-todo-face ((((class color) (min-colors 89)) (:foreground "#6272a4"))))
 '(org-agenda-done ((((class color) (min-colors 89)) (:foreground "#50fa7b"))))
 '(org-agenda-structure ((((class color) (min-colors 89)) (:foreground "#bd93f9"))))
 '(org-block ((((class color) (min-colors 89)) (:foreground "#ffb86c"))))
 '(org-code ((((class color) (min-colors 89)) (:foreground "#f1fa8c"))))
 '(org-column ((((class color) (min-colors 89)) (:background "#565761"))))
 '(org-column-title ((((class color) (min-colors 89)) (:inherit org-column :weight bold :underline t))))
 '(org-date ((((class color) (min-colors 89)) (:foreground "#8be9fd" :underline t))))
 '(org-document-info ((((class color) (min-colors 89)) (:foreground "#0189cc"))))
 '(org-document-info-keyword ((((class color) (min-colors 89)) (:foreground "#6272a4"))))
 '(org-document-title ((((class color) (min-colors 89)) (:weight bold :foreground "#ffb86c" :height 1.44))))
 '(org-done ((((class color) (min-colors 89)) (:foreground "#50fa7b"))))
 '(org-ellipsis ((((class color) (min-colors 89)) (:foreground "#6272a4"))))
 '(org-footnote ((((class color) (min-colors 89)) (:foreground "#0189cc"))))
 '(org-formula ((((class color) (min-colors 89)) (:foreground "#ff79c6"))))
 '(org-headline-done ((((class color) (min-colors 89)) (:foreground "#6272a4" :bold nil :strike-through t))))
 '(org-hide ((((class color) (min-colors 89)) (:foreground "#282a36" :background "#282a36"))))
 '(org-level-1 ((((class color) (min-colors 89)) (:inherit bold :foreground "#ff79c6" :height 1.3))))
 '(org-level-2 ((((class color) (min-colors 89)) (:inherit bold :foreground "#bd93f9" :height 1.1))))
 '(org-level-3 ((((class color) (min-colors 89)) (:bold nil :foreground "#50fa7b" :height 1.0))))
 '(org-level-4 ((((class color) (min-colors 89)) (:bold nil :foreground "#f1fa8c"))))
 '(org-level-5 ((((class color) (min-colors 89)) (:bold nil :foreground "#8be9fd"))))
 '(org-level-6 ((((class color) (min-colors 89)) (:bold nil :foreground "#ffb86c"))))
 '(org-level-7 ((((class color) (min-colors 89)) (:bold nil :foreground "#0189cc"))))
 '(org-level-8 ((((class color) (min-colors 89)) (:bold nil :foreground "#f8f8f2"))))
 '(org-link ((((class color) (min-colors 89)) (:foreground "#8be9fd" :underline t))))
 '(org-priority ((((class color) (min-colors 89)) (:foreground "#8be9fd"))))
 '(org-scheduled ((((class color) (min-colors 89)) (:foreground "#50fa7b"))))
 '(org-scheduled-previously ((((class color) (min-colors 89)) (:foreground "#f1fa8c"))))
 '(org-scheduled-today ((((class color) (min-colors 89)) (:foreground "#50fa7b"))))
 '(org-sexp-date ((((class color) (min-colors 89)) (:foreground "#b6b6b2"))))
 '(org-special-keyword ((((class color) (min-colors 89)) (:foreground "#f1fa8c"))))
 '(org-table ((((class color) (min-colors 89)) (:foreground "#bd93f9"))))
 '(org-tag ((((class color) (min-colors 89)) (:foreground "#ff79c6" :bold t :background "#373844"))))
 '(org-todo ((((class color) (min-colors 89)) (:foreground "#ffb86c" :bold t :background "#373844"))))
 '(org-upcoming-deadline ((((class color) (min-colors 89)) (:foreground "#f1fa8c"))))
 '(org-warning ((((class color) (min-colors 89)) (:weight bold :foreground "#ff79c6"))))
 '(outline-1 ((((class color) (min-colors 89)) (:foreground "#50fa7b"))))
 '(outline-2 ((((class color) (min-colors 89)) (:foreground "#bd93f9"))))
 '(outline-3 ((((class color) (min-colors 89)) (:foreground "#8be9fd"))))
 '(outline-4 ((((class color) (min-colors 89)) (:foreground "#ffb86c"))))
 '(outline-5 ((((class color) (min-colors 89)) (:foreground "#ffb86c"))))
 '(outline-6 ((((class color) (min-colors 89)) (:foreground "#0189cc"))))
 '(undo-tree-visualizer-current-face ((((class color) (min-colors 89)) :foreground "#ffb86c")))
 '(undo-tree-visualizer-default-face ((((class color) (min-colors 89)) :foreground "#e2e2dc")))
 '(undo-tree-visualizer-register-face ((((class color) (min-colors 89)) :foreground "#bd93f9")))
 '(undo-tree-visualizer-unmodified-face ((((class color) (min-colors 89)) :foreground "#f8f8f2")))
 '(dired-directory ((((class color) (min-colors 89)) (:foreground "#50fa7b" :weight normal))))
 '(dired-flagged ((((class color) (min-colors 89)) (:foreground "#ff79c6"))))
 '(dired-header ((((class color) (min-colors 89)) (:foreground "#ccccc7" :background "#282a36"))))
 '(dired-ignored ((((class color) (min-colors 89)) (:inherit shadow))))
 '(dired-mark ((((class color) (min-colors 89)) (:foreground "#f8f8f2" :weight bold))))
 '(dired-marked ((((class color) (min-colors 89)) (:foreground "#ffb86c" :weight bold))))
 '(dired-perm-write ((((class color) (min-colors 89)) (:foreground "#ccccc7" :underline t))))
 '(dired-symlink ((((class color) (min-colors 89)) (:foreground "#f1fa8c" :weight normal :slant italic))))
 '(dired-warning ((((class color) (min-colors 89)) (:foreground "#ffb86c" :underline t))))
 '(default ((((type nil)) (:background "#000000" :foreground "#f8f8f2")) (((class color) (min-colors 89)) (:background "#282a36" :foreground "#f8f8f2"))))
 '(mode-line-buffer-id ((t :inherit sml/filename :foreground nil :background nil)))
 '(sml/global ((t :foreground "grey20" :background "grey85" :inverse-video nil)))
 '(sml/line-number ((t :foreground "Black" :inherit sml/global :weight bold :background "grey85")))
 '(sml/remote ((t :inherit sml/global :background "grey85")))
 '(sml/col-number ((t :inherit sml/global :background "grey85")))
 '(sml/numbers-separator ((t :inherit sml/col-number :background "grey85")))
 '(sml/client ((t :inherit sml/prefix :background "grey85")))
 '(sml/mule-info ((t :inherit sml/global :background "grey85")))
 '(sml/not-modified ((t :inherit sml/global :background "grey85")))
 '(sml/read-only ((t :inherit sml/not-modified :foreground "DarkGreen" :weight bold)))
 '(sml/prefix ((t :background "Grey70" :inherit sml/global :foreground "#5b2507" :weight bold)))
 '(sml/filename ((t :background "Grey70" :inherit sml/global :foreground "Blue" :weight bold)))
 '(sml/sudo ((t :background "Grey70" :inherit sml/outside-modified)))
 '(sml/git ((t :background "Grey70" :inherit (sml/read-only sml/prefix))))
 '(sml/folder ((t :background "Grey70" :inherit sml/global :weight normal :foreground "Black")))
 '(sml/name-filling ((t :background "Grey57" :inherit sml/prefix :weight normal)))
 '(sml/position-percentage ((t :background "Grey57" :inherit sml/prefix :weight normal :foreground "#330000")))
 '(sml/modes ((t :background "Grey57" :inherit sml/global :foreground "Gray10")))
 '(sml/process ((t :background "Grey57" :inherit sml/prefix)))
 '(sml/vc ((t :background "Grey57" :inherit sml/git :foreground "#0000aa")))
 '(sml/vc-edited ((t :background "Grey57" :inherit sml/prefix :foreground "#330000")))
 '(sml/minor-modes ((t :inherit sml/folder)))
 '(sml/discharging ((t :background "grey85" :inherit sml/global :foreground "Red")))
 '(sml/time ((t :background "grey85" :inherit sml/global))))

(provide-theme 'gon)