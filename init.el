(set 'ad-redefinition-action 'accept)
(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)
(setq scroll-step 1)
(setq scroll-conservatively 1000)
(setq column-number-mode t)
(setq transient-mark-mode t)
(setq sml/no-confirm-load-theme t)
(setq auto-package-update-delete-old-versions t)



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

;; split customizations
(add-to-list 'load-path "~/.emacs.d/customizations")

;; themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")



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
(setq scroll-bar-mode -1)

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
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-mode t nil (cua-base))
 '(cua-overwrite-cursor-color "#e5c06d")
 '(cua-read-only-cursor-color "#8ac6f2")
 '(custom-enabled-themes '(tomorrow-night-bright))
 '(custom-safe-themes
   '("51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "d88049c628f3a8a92f9e46982d3e891867e4991de2b3a714f29f9f5eb91638c1" "99f33ab65f95eb115331717f17ec4d319a939ad7d77b1949498e60217233db0a" "bab3fe9d9a4195294b511bc15f9593b68c0584ee2c901cc0ea63450874634049" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "7a994c16aa550678846e82edc8c9d6a7d39cc6564baaaacc305a3fdc0bd8725f" "730a87ed3dc2bf318f3ea3626ce21fb054cd3a1471dcd59c81a4071df02cb601" "93ed23c504b202cf96ee591138b0012c295338f38046a1f3c14522d4a64d7308" "71e5acf6053215f553036482f3340a5445aee364fb2e292c70d9175fb0cc8af7" "d74c5485d42ca4b7f3092e50db687600d0e16006d8fa335c69cf4f379dbd0eee" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "9b272154fb77a926f52f2756ed5872877ad8d73d018a426d44c6083d1ed972b1" "632694fd8a835e85bcc8b7bb5c1df1a0164689bc6009864faed38a9142b97057" "a92e9da0fab90cbec4af4a2035602208cebf3d071ea547157b2bfc5d9bd4d48d" "3d3807f1070bb91a68d6638a708ee09e63c0825ad21809c87138e676a60bda5d" "912cac216b96560654f4f15a3a4d8ba47d9c604cbc3b04801e465fb67a0234f0" "d71aabbbd692b54b6263bfe016607f93553ea214bc1435d17de98894a5c3a086" "9b01a258b57067426cc3c8155330b0381ae0d8dd41d5345b5eddac69f40d409b" "fe94e2e42ccaa9714dd0f83a5aa1efeef819e22c5774115a9984293af609fce7" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "d0fa4334234e97ece3d72d86e39a574f8256b4a8699a1fb5390c402892a1c024" "76c5b2592c62f6b48923c00f97f74bcb7ddb741618283bdb2be35f3c0e1030e3" "7f1263c969f04a8e58f9441f4ba4d7fb1302243355cb9faecb55aec878a06ee9" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" "52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "2749f19d8f104565184ff2217e10152e9e3cbe32a130dec1a51b9e0fed82a4b1" "cc64e1b1faaf38d66ee881d051de86560f339c791d9c497e7930897ce1afa201" "5db27426ade741abaf25f5347abe92b1d505adef7c974d2ab2648a664d14f867" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "a7051d761a713aaf5b893c90eaba27463c791cd75d7257d3a8e66b0c8c346e77" "041939941dbf5df4516351b72d603230f774fcf79babe3b480cfc6c050fb3549" "2ec562753a7cce26ab21fb6de28b77c57eaaa118d79cac8a19640239357a5f11" "b9e9ba5aeedcc5ba8be99f1cc9301f6679912910ff92fdf7980929c2fc83ab4d" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "47afd772d3e59ea0a509c73e49547c5b19185d8fb640ab2bede9b54324d55fc5" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "2cbe4065741d4e20c0d872003315b37939d0ed943a91e6cf4004047dc7df0118" default))
 '(fci-rule-color "#14151E")
 '(highlight-changes-colors '("#e5786d" "#834c98"))
 '(highlight-symbol-colors
   '("#551b4b293a05" "#3f214d7540e0" "#5a1a48ea46fe" "#3fbe327642ee" "#42724c8355d4" "#536946893a1a" "#46c448dd5357"))
 '(highlight-symbol-foreground-color "#999791")
 '(highlight-tail-colors
   '(("#2f2f2d" . 0)
     ("#3d454c" . 20)
     ("#3a463b" . 30)
     ("#40424a" . 50)
     ("#4c4436" . 60)
     ("#4a4136" . 70)
     ("#4c3935" . 85)
     ("#2f2f2d" . 100)))
 '(hl-bg-colors
   '("#4c4436" "#4a4136" "#4f4340" "#4c3935" "#3b313d" "#40424a" "#3a463b" "#3d454c"))
 '(hl-fg-colors
   '("#2a2929" "#2a2929" "#2a2929" "#2a2929" "#2a2929" "#2a2929" "#2a2929" "#2a2929"))
 '(hl-paren-colors '("#7ec98f" "#e5c06d" "#a4b5e6" "#834c98" "#8ac6f2"))
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
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
     ("\\?\\?\\?+" . "#dc752f")))
 '(inhibit-startup-screen t)
 '(jdee-db-active-breakpoint-face-colors (cons "#0d0d0d" "#81a2be"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#0d0d0d" "#b5bd68"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#0d0d0d" "#5a5b5a"))
 '(lsp-ui-doc-border "#999791")
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(objed-cursor-color "#cc6666")
 '(package-selected-packages
   '(ctrlf company-prescient selectrum-prescient selectrum clj-refactor inf-clojure yasnippet all-the-icons flycheck-clj-kondo spacemacs-theme groovy treemacs-icons-dired treemacs-projectile treemacs treemacs-magit rainbow-delimiters iedit sr-speedbar yasnippet-snippets markdown-mode+ visual-regexp-steroids visual-regexp ace-window powerline f diminish cl-lib aggressive-indent-mode counsel ivy-hydra ivy flycheck-pos-tip git-timemachine hungry-delete solarized-theme zenburn-theme counsel-projectile magit-gitflow flycheck-clojure flycheck smart-mode-line-powerline-theme smart-mode-line ivy-rich use-package flx dracula-theme bm magit web-mode parinfer kibit-helper cloc undo-tree smex projectile paxedit markdown-mode groovy-mode git-gutter company clojure-mode-extra-font-locking auto-highlight-symbol aggressive-indent adoc-mode))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(pos-tip-background-color "#2f2f2d")
 '(pos-tip-foreground-color "#999791")
 '(rustic-ansi-faces
   ["#1d1f21" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#c9b4cf" "#8abeb7" "#c5c8c6"])
 '(safe-local-variable-values '((cider-repl-history-file . ".cider-nrepl.history")))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#8ac6f2" "#2f2f2d" 0.2))
 '(sml/mode-width
   '(if
        (eq
         (powerline-current-separator)
         'arrow)
        'right 'full))
 '(sml/pos-id-separator
   ''(""
      (:propertize " " face powerline-active1)
      (:eval
       (propertize " " 'display
                   (funcall
                    (intern
                     (format "powerline-%s-%s"
                             (powerline-current-separator)
                             (car powerline-default-separator-dir)))
                    'powerline-active1 'powerline-active2)))
      (:propertize " " face powerline-active2)))
 '(sml/pos-minor-modes-separator
   ''(""
      (:propertize " " face powerline-active1)
      (:eval
       (propertize " " 'display
                   (funcall
                    (intern
                     (format "powerline-%s-%s"
                             (powerline-current-separator)
                             (cdr powerline-default-separator-dir)))
                    'powerline-active1 'sml/global)))
      (:propertize " " face sml/global)))
 '(sml/pre-id-separator
   ''(""
      (:propertize " " face sml/global)
      (:eval
       (propertize " " 'display
                   (funcall
                    (intern
                     (format "powerline-%s-%s"
                             (powerline-current-separator)
                             (car powerline-default-separator-dir)))
                    'sml/global 'powerline-active1)))
      (:propertize " " face powerline-active1)))
 '(sml/pre-minor-modes-separator
   ''(""
      (:propertize " " face powerline-active2)
      (:eval
       (propertize " " 'display
                   (funcall
                    (intern
                     (format "powerline-%s-%s"
                             (powerline-current-separator)
                             (cdr powerline-default-separator-dir)))
                    'powerline-active2 'powerline-active1)))
      (:propertize " " face powerline-active1)))
 '(sml/pre-modes-separator '(propertize " " 'face 'sml/modes))
 '(sr-speedbar-right-side nil)
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#d54e53")
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
     (360 . "DarkOliveGreen3")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496"))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))



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


(use-package company
  :ensure t
  :defer 5
  :config (global-company-mode))

(use-package git-gutter
  :ensure t
  :config (global-git-gutter-mode +1))


(global-set-key (kbd "TAB") #'company-indent-or-complete-common)

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

;; (use-package clj-refactor
;;   :ensure t
;;   :config (setq cljr-warn-on-eval nil))

;; disable the broken below package
;;(require 'cider-eval-sexp-fu)

;; (use-package rainbow-delimiters
;;   :ensure t
;;   :hook
;;   ((prog-mode cider-repl-mode) . rainbow-delimiters-mode))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))




;; (add-hook 'cider-mode-hook
;;	  '(lambda () (add-hook 'after-save-hook
;;				'(lambda ()
;;				   (if (and (boundp 'cider-mode) cider-mode)
;;				       (cider-ns-refresh))))))


(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

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
(fset 'copy-and-paste-sexp
      [?\C-\M-  ?\M-w ?\C-\M-f return return ?\C-y])
(global-set-key (quote [S-f5]) 'copy-and-paste-sexp)

(fset 'copy-sexp
      [?\C-\M-  ?\M-w ?\C-\M-f])
(global-set-key (quote [f5]) 'copy-sexp)


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
(add-hook 'before-save-hook 'whitespace-cleanup)

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
  :diminish
  :hook
  (prog-mode       . turn-on-eldoc-mode)
                                        ;(cider-repl-mode . turn-on-eldoc-mode)
  )

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
          treemacs-sorting                       'alphabetic-asc
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

(use-package hideshow
  :hook ((prog-mode . hs-minor-mode)))

(use-package selectrum
  :ensure t
  :config
  (use-package selectrum-prescient
    :ensure t)
  (use-package company-prescient
    :ensure t)
  (selectrum-mode +1)

  ;; to make sorting and filtering more intelligent
  (selectrum-prescient-mode +1)
  (company-prescient-mode +1)

  ;; to save your command history on disk, so the sorting gets more
  ;; intelligent over time
  (prescient-persist-mode +1))

(use-package ctrlf
  :ensure t
  :init (ctrlf-mode +1)
  :bind
  (:map ctrlf--keymap
   ("M-S-s _" . ctrlf-forward-symbol)
    ("M-S-s ." . ctrlf-forward-symbol-at-point)
    ("M-S-s o" . ctrlf-occur)
    ("M-S-s c" . ctrlf-toggle-case-fold-search)
    ("M-S-s r" . ctrlf-toggle-regexp)
    ("M-S-s s" . ctrlf-change-search-style)))

;; Fun

(defun comment-sexp ()
  "Comment out the sexp at point."
  (interactive)
  (save-excursion
    (insert "#_")))
(define-key paredit-mode-map (kbd "C-#") 'comment-sexp)

(load "remote-term.el")

(load "misc.el")

(load "ui.el")

(load "clojure.el")

;; enable cider or inf-clojure, but not both
(load "cider-cust.el")

;;(load "inf-clj.el")
