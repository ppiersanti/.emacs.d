(set 'ad-redefinition-action 'accept)
(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)
(setq scroll-step 1)
(setq scroll-conservatively 1000)
(setq column-number-mode t)
(setq transient-mark-mode t)
(setq sml/no-confirm-load-theme t)

(global-set-key (quote [f2]) 'dabbrev-expand)
(global-set-key (quote [f3]) 'dabbrev-completion)
(global-set-key (quote [f5]) 'compile)
(global-set-key (quote [f9]) 'copy-and-comment)
(global-set-key (quote [f11]) 'indent-region)
(global-set-key (quote [f12]) 'comment-or-uncomment-region)
(global-set-key [C-tab] 'other-window)
(global-set-key [C-S-tab] (lambda () (interactive) (other-window -1)))

(setq compilation-scroll-output t)

(require 'package)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	;;        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; backup
(defvar --backup-directory (concat user-emacs-directory "backups"))
(setq backup-directory-alist `((".*" . , --backup-directory)))
(setq auto-save-file-name-transforms
      `((".*" , --backup-directory t)))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 10               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 30              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 300)            ; number of keystrokes between auto-saves (default: 300)



(setq compilation-ask-about-save nil)

(setq initial-frame-alist '((tool-bar-lines . 0)))
(toggle-scroll-bar -1)

(add-to-list 'load-path "~/.emacs.d/site-lisp")
(autoload 'adoc-mode "adoc-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.adoc$" . adoc-mode))
;;(add-hook 'adoc-mode-hook
;;          '(lambda ()
;;             (turn-on-auto-fill)
;;             (require 'asciidoc)))

;; map org file to org-mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

					;(setq visible-bell t)
(setq ring-bell-function
      (lambda ()
	(unless (memq this-command)
          '(isearch-abort abort-recursive-edit
			  exit-minibuffer keyboard-quit)
	  (invert-face 'mode-line)
	  (run-with-timer 0.1 nil 'invert-face 'mode-line))))

(display-time)

;; (defun save-buffer-if-visiting-file (&optional args)
;;   "Save the current buffer only if it is visiting a file"
;;   (interactive)
;;   (if (and (buffer-file-name) (buffer-modified-p))
;;       (save-buffer args)))

;; (add-hook 'auto-save-hook 'save-buffer-if-visiting-file)

;; (setq auto-save-interval 1
;;       auto-save-timeout 1)

(show-paren-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(cider-repl-use-pretty-printing t)
 '(cljr-favor-prefix-notation t)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (tsdh-light)))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "2749f19d8f104565184ff2217e10152e9e3cbe32a130dec1a51b9e0fed82a4b1" "cc64e1b1faaf38d66ee881d051de86560f339c791d9c497e7930897ce1afa201" "5db27426ade741abaf25f5347abe92b1d505adef7c974d2ab2648a664d14f867" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "a7051d761a713aaf5b893c90eaba27463c791cd75d7257d3a8e66b0c8c346e77" "041939941dbf5df4516351b72d603230f774fcf79babe3b480cfc6c050fb3549" "2ec562753a7cce26ab21fb6de28b77c57eaaa118d79cac8a19640239357a5f11" "b9e9ba5aeedcc5ba8be99f1cc9301f6679912910ff92fdf7980929c2fc83ab4d" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "47afd772d3e59ea0a509c73e49547c5b19185d8fb640ab2bede9b54324d55fc5" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "2cbe4065741d4e20c0d872003315b37939d0ed943a91e6cf4004047dc7df0118" default)))
 '(fci-rule-color "#14151E")
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2aa198")
     ("PROG" . "#268bd2")
     ("OKAY" . "#268bd2")
     ("DONT" . "#d70000")
     ("FAIL" . "#d70000")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#875f00")
     ("KLUDGE" . "#875f00")
     ("HACK" . "#875f00")
     ("TEMP" . "#875f00")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f"))))
 '(inhibit-startup-screen t)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (spacemacs-theme groovy treemacs-icons-dired treemacs-projectile treemacs treemacs-magit rainbow-delimiters iedit sr-speedbar yasnippet-snippets markdown-mode+ visual-regexp-steroids visual-regexp ace-window powerline f cider diminish cl-lib aggressive-indent-mode counsel ivy-hydra ivy flycheck-pos-tip git-timemachine hungry-delete solarized-theme zenburn-theme counsel-projectile magit-gitflow flycheck-clojure flycheck smart-mode-line-powerline-theme smart-mode-line ivy-rich use-package flx dracula-theme bm magit web-mode parinfer kibit-helper cloc ac-cider undo-tree smex projectile paxedit markdown-mode groovy-mode git-gutter company clojure-mode-extra-font-locking clj-refactor cider-eval-sexp-fu auto-highlight-symbol aggressive-indent adoc-mode)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(sml/mode-width
   (quote
    (if
	(eq
	 (powerline-current-separator)
	 (quote arrow))
	(quote right)
      (quote full))))
 '(sml/pos-id-separator
   (quote
    (quote
     (""
      (:propertize " " face powerline-active1)
      (:eval
       (propertize " "
		   (quote display)
		   (funcall
		    (intern
		     (format "powerline-%s-%s"
			     (powerline-current-separator)
			     (car powerline-default-separator-dir)))
		    (quote powerline-active1)
		    (quote powerline-active2))))
      (:propertize " " face powerline-active2)))))
 '(sml/pos-minor-modes-separator
   (quote
    (quote
     (""
      (:propertize " " face powerline-active1)
      (:eval
       (propertize " "
		   (quote display)
		   (funcall
		    (intern
		     (format "powerline-%s-%s"
			     (powerline-current-separator)
			     (cdr powerline-default-separator-dir)))
		    (quote powerline-active1)
		    (quote sml/global))))
      (:propertize " " face sml/global)))))
 '(sml/pre-id-separator
   (quote
    (quote
     (""
      (:propertize " " face sml/global)
      (:eval
       (propertize " "
		   (quote display)
		   (funcall
		    (intern
		     (format "powerline-%s-%s"
			     (powerline-current-separator)
			     (car powerline-default-separator-dir)))
		    (quote sml/global)
		    (quote powerline-active1))))
      (:propertize " " face powerline-active1)))))
 '(sml/pre-minor-modes-separator
   (quote
    (quote
     (""
      (:propertize " " face powerline-active2)
      (:eval
       (propertize " "
		   (quote display)
		   (funcall
		    (intern
		     (format "powerline-%s-%s"
			     (powerline-current-separator)
			     (cdr powerline-default-separator-dir)))
		    (quote powerline-active2)
		    (quote powerline-active1))))
      (:propertize " " face powerline-active1)))))
 '(sml/pre-modes-separator (quote (propertize " " (quote face) (quote sml/modes))))
 '(sr-speedbar-right-side nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#d54e53")
     (40 . "goldenrod")
     (60 . "#e7c547")
     (80 . "DarkOliveGreen3")
     (100 . "#70c0b1")
     (120 . "DeepSkyBlue1")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "goldenrod")
     (200 . "#e7c547")
     (220 . "DarkOliveGreen3")
     (240 . "#70c0b1")
     (260 . "DeepSkyBlue1")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "goldenrod")
     (340 . "#e7c547")
     (360 . "DarkOliveGreen3"))))
 '(vc-annotate-very-old-color nil))



(use-package diminish
  :ensure t)
(require 'bind-key)

;; indentation
(defun indent-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))
(global-set-key (kbd "C-M-l") nil)
(global-set-key (kbd "C-M-l") 'indent-buffer)

;; newline-without-break-of-line
(defun newline-without-break-of-line ()
  (interactive)
  (let ((oldpos (point)))
    (end-of-line)
    (newline-and-indent)))
(global-set-key (kbd "<S-return>") 'newline-without-break-of-line)

(defun duplicate-line (arg)
  "Duplicate current line, leaving point in lower line."
  (interactive "*p")

  ;; save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))

  ;; local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion

      ;; don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))

      ;; store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        ;; insert the line arg times
        (while (> count 0)
          (newline)         ;; because there is no newline in 'line'
          (insert line)
          (setq count (1- count))))


      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list))))
					; end-of-let

  ;; put the point in the lowest line and return
  (next-line arg))

(global-set-key (kbd "C-x C-d") 'duplicate-line)

;;; CIDER stuff

;; cider cljs nRepl conf
(use-package cider
  :ensure t)
(setq cider-cljs-lein-repl
      "(do (user/run)
           (user/browser-repl))")
;; "(do (require 'figwheel-sidecar.repl-api)
;;      (figwheel-sidecar.repl-api/start-figwheel!)
;;      (figwheel-sidecar.repl-api/cljs-repl))"


(use-package company
  :ensure t
  :defer 5
  :config (global-company-mode))

(use-package git-gutter
  :ensure t
  :config (global-git-gutter-mode +1))


(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook #'paxedit-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)
(add-hook 'clojure-mode-hook #'subword-mode)
(add-hook 'cider-mode-hook #'eldoc-mode)


(add-hook 'cider-repl-mode-hook #'paredit-mode)
(add-hook 'cider-repl-mode-hook #'paxedit-mode)
(add-hook 'cider-repl-mode-hook #'subword-mode)
(add-hook 'cider-repl-mode-hook #'eldoc-mode)
;;(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)  ;; does not work
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(setq cider-overlays-use-font-lock t)
(setq cider-font-lock-dynamically '(macro core function var))
(setq clojure-align-forms-automatically t)
(setq cider-prompt-save-file-on-load 'always-save)

(setq cider-test-show-report-on-success t)
(setq cider-repl-history-size 1000)
(setq cider-prompt-for-symbol nil)

(use-package clojure-mode-extra-font-locking
  :ensure t)

;; highlight words
(use-package auto-highlight-symbol
  :ensure t
  :config (progn
	    (global-auto-highlight-symbol-mode t)
	    (global-hl-line-mode)
	    (auto-highlight-symbol-mode t)))

;; undo tree
(use-package undo-tree
  :ensure t
  :config (global-undo-tree-mode t))

(use-package clj-refactor
  :ensure t
  :config (setq cljr-warn-on-eval nil))

;; disable the broken below package
;;(require 'cider-eval-sexp-fu)

(use-package rainbow-delimiters
  :ensure t
  :hook
  ((prog-mode cider-repl-mode) . rainbow-delimiters-mode))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))



(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  (yas-reload-all)
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(defun compile-and-run-main ()
  (cider-load-buffer)
  (cider-run))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)
(global-set-key (quote [F5]) 'cider-run)

(add-hook 'cider-mode-hook
	  '(lambda () (add-hook 'after-save-hook
				'(lambda ()
				   (if (and (boundp 'cider-mode) cider-mode)
				       (cider-ns-refresh))))))

(defun cider-namespace-refresh ()
  (interactive)
  (cider-interactive-eval
   "(require 'clojure.tools.namespace.repl)
   (clojure.tools.namespace.repl/refresh)"))

(define-key clojure-mode-map (kbd "C-c C-r") 'cider-refresh)


(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t nil)))
 '(region ((t (:background "gold" :distant-foreground "gtk_selection_fg_color")))))



;;; Smex
(autoload 'smex "smex")
(global-set-key (kbd "<M-x S>") 'smex)



;; (require 'ac-cider)
;; (add-hook 'cider-mode-hook 'ac-flyspell-workaround)
;; (add-hook 'cider-mode-hook 'ac-cider-setup)
;; (add-hook 'cider-repl-mode-hook 'ac-cider-setup)
;; (eval-after-load "auto-complete"
;;     '(add-to-list 'ac-modes 'cider-mode))


;; copy and paste form
(fset 'copy-and-paste
      [?\C-\M-  ?\M-w ?\C-\M-f return return ?\C-y])
(global-set-key (quote [f5]) 'copy-and-paste)



(setq org-confirm-babel-evaluate nil)
(setq org-export-babel-evaluate nil)
(setq org-startup-indented t)
;; Update images from babel code blocks automatically
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (emacs-lisp . t)
   (clojure . t)))


(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;;; Ivy

(use-package ivy
  :ensure t
  :demand t
  :diminish ivy-mode
  :load-path "site-lisp/site-ivy/swiper"
  :bind (("C-x b" . ivy-switch-buffer)
         ("C-x B" . ivy-switch-buffer-other-window)
         ("M-H"   . ivy-resume))
  :commands ivy-mode
  :config
  (setq ivy-initial-inputs-alist nil
        ivy-re-builders-alist '((t . ivy--regex-ignore-order))
	magit-completing-read-function 'ivy-completing-read
	projectile-completion-system 'ivy
	ivy-use-virtual-buffers t
	enable-recursive-minibuffers t)

  (ivy-mode 1)

  (bind-key "C-r" #'ivy-previous-line-or-history ivy-minibuffer-map)
  (bind-key "M-r" #'ivy-reverse-i-search ivy-minibuffer-map)

  (use-package ivy-hydra
    :ensure t)

  (use-package ivy-rich
    :ensure t
    :after (:all ivy counsel)
    :init (setq ivy-rich-parse-remote-file-path t)
    :config (ivy-rich-mode 1))

    (use-package swiper
    :demand t
    :load-path "site-lisp/ivy/swiper"
    :bind (("C-s" . swiper)
           ("C-. C-s" . swiper)
           ("C-. C-r" . swiper))
    :commands swiper-from-isearch
    :init
    (bind-key "C-." #'swiper-from-isearch isearch-mode-map)
    :config
    (bind-key "M-y" #'yank swiper-map)
    (bind-key "M-%" #'swiper-query-replace swiper-map)
    (bind-key "M-h" #'swiper-avy swiper-map)
    (bind-key "M-c" #'swiper-mc swiper-map))

  (use-package counsel
    :ensure t
    :demand t
    :diminish counsel-mode
    :bind (("M-x"     . counsel-M-x)
           ("C-h f"   . counsel-describe-function)
           ("C-h v"   . counsel-describe-variable)
           ("C-h E l" . counsel-find-library)
           ("C-h E u" . counsel-unicode-char))
    :commands counsel-minibuffer-history
    :init
    (define-key minibuffer-local-map (kbd "M-r")
      'counsel-minibuffer-history))
  :config
  (counsel-mode 1))

(use-package magit
  :ensure t
  :load-path ("site-lisp/site-git/magit/lisp"
              "lib/with-editor")
  :bind (("C-x g" . magit-status)
         ("C-x G" . magit-status-with-prefix))
  :preface
  (defun magit-monitor (&optional no-display)
    "Start git-monitor in the current directory."
    (interactive)
    (when (string-match "\\*magit: \\(.+\\)" (buffer-name))
      (let ((name (format "*git-monitor: %s*"
                          (match-string 1 (buffer-name)))))
        (or (get-buffer name)
            (let ((buf (get-buffer-create name)))
              (ignore-errors
                (start-process "*git-monitor*" buf "git-monitor"
                               "-d" (expand-file-name default-directory)))
              buf)))))

  (defun magit-status-with-prefix ()
    (interactive)
    (let ((current-prefix-arg '(4)))
      (call-interactively 'magit-status)))

    ;(magit-status-internal dir switch-function))

  (defun eshell/git (&rest args)
    (cond
     ((or (null args)
          (and (string= (car args) "status") (null (cdr args))))
      (magit-status-internal default-directory))
     ((and (string= (car args) "log") (null (cdr args)))
      (magit-log "HEAD"))
     (t (throw 'eshell-replace-command
               (eshell-parse-command
                "*git"
                (eshell-stringify-list (eshell-flatten-list args)))))))

  :init
  (add-hook 'magit-mode-hook 'hl-line-mode)

  (use-package git-commit)

  :config
  (setenv "GIT_PAGER" ""))


(diminish 'magit-wip-after-save-local-mode)
(diminish 'magit-wip-after-apply-mode)
(diminish 'magit-wip-before-change-mode)


(add-hook 'magit-log-edit-mode-hook
	  #'(lambda ()
	      (set-fill-column 72)
	      (flyspell-mode 1)))

(add-hook 'magit-status-mode-hook #'(lambda () (magit-monitor t)))

(remove-hook 'server-switch-hook 'magit-commit-diff)

;; Bookmarks

(use-package bm
         :ensure t
         :demand t

         :init
         ;; restore on load (even before you require bm)
         (setq bm-restore-repository-on-load t)


         :config
         ;; Allow cross-buffer 'next'
         (setq bm-cycle-all-buffers t)

         ;; where to store persistant files
         (setq bm-repository-file "~/.emacs.d/bm-repository")

         ;; save bookmarks
         (setq-default bm-buffer-persistence t)

         ;; Loading the repository from file when on start up.
         (add-hook' after-init-hook 'bm-repository-load)

         ;; Restoring bookmarks when on file find.
         (add-hook 'find-file-hooks 'bm-buffer-restore)

         ;; Saving bookmarks
         (add-hook 'kill-buffer-hook #'bm-buffer-save)

         ;; Saving the repository to file when on exit.
         ;; kill-buffer-hook is not called when Emacs is killed, so we
         ;; must save all bookmarks first.
         (add-hook 'kill-emacs-hook #'(lambda nil
                                          (bm-buffer-save-all)
                                          (bm-repository-save)))

         ;; The `after-save-hook' is not necessary to use to achieve persistence,
         ;; but it makes the bookmark data in repository more in sync with the file
         ;; state.
         (add-hook 'after-save-hook #'bm-buffer-save)

         ;; Restoring bookmarks
         (add-hook 'find-file-hooks   #'bm-buffer-restore)
         (add-hook 'after-revert-hook #'bm-buffer-restore)

         ;; The `after-revert-hook' is not necessary to use to achieve persistence,
         ;; but it makes the bookmark data in repository more in sync with the file
         ;; state. This hook might cause trouble when using packages
         ;; that automatically reverts the buffer (like vc after a check-in).
         ;; This can easily be avoided if the package provides a hook that is
         ;; called before the buffer is reverted (like `vc-before-checkin-hook').
         ;; Then new bookmarks can be saved before the buffer is reverted.
         ;; Make sure bookmarks is saved before check-in (and revert-buffer)
         (add-hook 'vc-before-checkin-hook #'bm-buffer-save)


         :bind (("<f4>" . bm-next)
                ("S-<f4>" . bm-previous)
                ("C-<f4>" . bm-toggle))
         )

;; from Howard

(require 'cl)

(use-package dash
 :ensure t
 :config (eval-after-load "dash" '(dash-enable-font-lock)))

(use-package s
  :ensure t)

(use-package f
  :ensure t)

(fset 'yes-or-no-p 'y-or-n-p)

;(when (window-system)
;  (tool-bar-mode 0)               ;; Toolbars were only cool with XEmacs
;  (when (fboundp 'horizontal-scroll-bar-mode)
;    (horizontal-scroll-bar-mode -1))
;  (scroll-bar-mode -1))            ;; Scrollbars are waste screen estate



(use-package powerline
 :ensure t
 :init
 (setq powerline-default-separator 'curve
       powerline-default-separator-dir (quote (left . right))
       powerline-height 22
       powerline-display-buffer-size nil
       powerline-display-hud nil
       powerline-display-mule-info nil
       powerline-gui-use-vcs-glyph t))

(use-package ace-window
 :ensure t
 :init
   (setq aw-keys '(?a ?s ?d ?f ?j ?k ?l ?o))
   (global-set-key (kbd "C-x o") 'ace-window)
 :diminish ace-window-mode)

;; delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; regex visual

(use-package visual-regexp
 :ensure t
 :init
 (use-package visual-regexp-steroids :ensure t)

 :bind (("C-c r" . vr/replace)
        ("C-c q" . vr/query-replace))

 ;; if you use multiple-cursors, this is for you:
 :config (use-package  multiple-cursors
           :bind ("C-c m" . vr/mc-mark)))


;; delete whitespace

(use-package hungry-delete
  :ensure t
  :config (global-hungry-delete-mode))


(use-package eldoc
  :diminish eldoc-mode
  :init  (setq eldoc-idle-delay 0.1))

;; folding

(defun ha/hs-show-all ()
  (interactive)
  (hs-minor-mode 1)
  (hs-show-all))

(defun ha/hs-hide-all ()
  (interactive)
  (hs-minor-mode 1)
  (hs-hide-all))

(defun ha/hs-toggle-hiding ()
  (interactive)
  (hs-minor-mode 1)
  (hs-toggle-hiding))

(use-package hs-minor-mode
  :bind
  ("C-c T h" . hs-minor-mode)
  ("C-c h a" . ha/hs-hide-all)
  ("C-c h s" . ha/hs-show-all)
  ("C-c h h" . ha/hs-toggle-hiding))


;; git time machine
(use-package git-timemachine
  :ensure t)

;; flyccheck clojure
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  ;(use-package flycheck-clojure
  ;  :ensure t
  ;  :config (flycheck-clojure-setup)
  ;  (use-package flycheck-pos-tip
  ;  :ensure t
					;  :config (setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))))
  )

;; (use-package flycheck-clojure
;;   :ensure t
;;   :after flycheck
;;   :config (flycheck-clojure-setup))

(use-package flycheck-pos-tip
  :ensure t)


(use-package projectile
  :load-path "site-lisp/projectile"
  :diminish projectile-mode
  :commands projectile-global-mode
  :defer 5
  :bind-keymap ("C-c p" . projectile-command-map)
  :config
  (use-package counsel-projectile
    :after ivy
    :if ivy-mode
    :load-path "site-lisp/site-ivy/counsel-projectile"
    :config
    (setq projectile-completion-system 'ivy)
    (define-key projectile-mode-map [remap projectile-ag]
      #'counsel-projectile-rg))
  (projectile-global-mode))



;; ;; (helm-mode 1)
;; ;; (require 'helm-config)
;; ;; (global-set-key (kbd "M-x") #'helm-M-x)
;; ;; (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
;; ;; (global-set-key (kbd "C-x C-f") #'helm-find-files)

(use-package smart-mode-line-powerline-theme
   :ensure t
   :after powerline
   :after smart-mode-line
   :config
   (setq sml/theme 'smart-mode-line-light-powerline)
   (sml/setup))

(use-package magit-gitflow
  :ensure t
  :after magit
  :config
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow))

(use-package aggressive-indent
  :ensure t)

(use-package paxedit
  :ensure t)


(put 'downcase-region 'disabled nil)

;; treemacs

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-desc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-width                         35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

(use-package groovy-mode
  :ensure t
  :mode "\\.groovy\\'\\|\\.gradle\\'")


;; Fun

(defun comment-sexp ()
  "Comment out the sexp at point."
  (interactive)
  (save-excursion
    (insert "#_")))
(define-key paredit-mode-map (kbd "C-#") 'comment-sexp)

;; rebind C-M-@ to work through terminal
;(global-set-key (kbd "C-M-SPC") 'mark-sexp)
(define-key input-decode-map " " [C-M-@])
(global-set-key (quote [C-M-@]) 'mark-sexp)
