(set 'ad-redefinition-action 'accept)
(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)
(setq scroll-step 1)
(setq scroll-conservatively 1000)
(setq column-number-mode t)
(setq transient-mark-mode t)
(global-set-key (quote [f2]) 'dabbrev-expand)
(global-set-key (quote [f3]) 'dabbrev-completion)
(global-set-key (quote [f5]) 'compile)
(global-set-key (quote [f9]) 'copy-and-comment)
(global-set-key (quote [f11]) 'indent-region)
(global-set-key (quote [f12]) 'comment-or-uncomment-region)
(global-set-key [C-tab] 'other-window)

(setq compilation-scroll-output t)

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
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (deeper-blue)))
 '(ido-everywhere t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (parinfer kibit-helper cloc ac-cider sr-speedbar undo-tree smex projectile paxedit markdown-mode ido-ubiquitous groovy-mode git-gutter company clojure-mode-extra-font-locking clj-refactor cider-eval-sexp-fu auto-highlight-symbol aggressive-indent adoc-mode))))



(require 'package) ;; You might already have this line

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
  ;;        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize) ;; You might already have this line


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

(global-set-key (kbd "C-d") nil)
(global-set-key (kbd "C-d") 'duplicate-line)

;;; CIDER stuff

;; cider cljs nRepl conf 
(require 'cider)
(setq cider-cljs-lein-repl
      "(do (user/run)
           (user/browser-repl))")
      ;; "(do (require 'figwheel-sidecar.repl-api)
      ;;      (figwheel-sidecar.repl-api/start-figwheel!)
      ;;      (figwheel-sidecar.repl-api/cljs-repl))"
      

;;
;;(require 'paxedit)

(setq ido-enable-flex-matching t)
(ido-mode 1)
(ido-everywhere t)

(require 'ido-completing-read+)
(ido-ubiquitous-mode 1)

(global-company-mode)
(global-git-gutter-mode +1)


;; (add-hook 'clojure-mode-hook #'paredit-mode)
;; (add-hook 'clojure-mode-hook #'paxedit-mode)
;; (add-hook 'clojure-mode-hook #'aggressive-indent-mode)
(add-hook 'clojure-mode-hook #'subword-mode)
(add-hook 'cider-mode-hook #'eldoc-mode)


;; (add-hook 'cider-repl-mode-hook #'paredit-mode)
;; (add-hook 'cider-repl-mode-hook #'paxedit-mode)
(add-hook 'cider-repl-mode-hook #'subword-mode)
(add-hook 'cider-repl-mode-hook #'eldoc-mode)
;;(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)  ;; does not work
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(setq cider-overlays-use-font-lock t)
(setq cider-font-lock-dynamically '(macro core function var))
(setq clojure-align-forms-automatically t)
(setq cider-prompt-save-file-on-load 'always-save)

(setq cider-test-show-report-on-success t)
(setq cider-repl-history-file "~/.emacs.d/cider-nrepl.history")
(setq cider-prompt-for-symbol nil)

(require 'clojure-mode-extra-font-locking)

;; highlight words
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)
(global-hl-line-mode)

;; undo tree
(global-undo-tree-mode t)

(require 'clj-refactor)
(setq cljr-warn-on-eval nil)

;; disable the broken below package
;;(require 'cider-eval-sexp-fu)

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
    '(lambda () (add-hook 'after-save-hook)
        '(lambda ()
           (if (and (boundp 'cider-mode) cider-mode)
               (cider-refresh)))))

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



(custom-set-faces)
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 


;;; Smex
(autoload 'smex "smex")
(global-set-key (kbd "<M-x S>") 'smex)



;; (require 'ac-cider)
;; (add-hook 'cider-mode-hook 'ac-flyspell-workaround)
;; (add-hook 'cider-mode-hook 'ac-cider-setup)
;; (add-hook 'cider-repl-mode-hook 'ac-cider-setup)
;; (eval-after-load "auto-complete"
;;     '(add-to-list 'ac-modes 'cider-mode))


(require 'sr-speedbar)
(require 'use-package)

(use-package parinfer
  :ensure t
  :bind
  (("C-," . parinfer-toggle-mode))
  :init
  (progn
    (setq parinfer-extensions
          '(defaults       ; should be included.
	     pretty-parens  ; different paren styles for different modes.
	     evil           ; If you use Evil.
	     lispy          ; If you use Lispy. With this extension, you should install Lispy and do not enable lispy-mode directly.
	     paredit        ; Introduce some paredit commands.
	     smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
	     smart-yank))   ; Yank behavior depend on mode.
    (add-hook 'clojure-mode-hook #'parinfer-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
    (add-hook 'common-lisp-mode-hook #'parinfer-mode)
    (add-hook 'scheme-mode-hook #'parinfer-mode)
    (add-hook 'lisp-mode-hook #'parinfer-mode)
    (add-hook 'cider-repl-mode-hook #'parinfer-mode)))

(setq parinfer-auto-switch-indent-mode t)
(setq parinfer-auto-switch-indent-mode-when-closing t)  ;; default
(setq parinfer-extensions '(defaults pretty-parens smart-yank))
