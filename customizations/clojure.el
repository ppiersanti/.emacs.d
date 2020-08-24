;; (use-package clojure-mode
;;   :mode (("\\.boot$"  . clojure-mode)
;;          ("\\.clj$"   . clojure-mode)
;;          ("\\.cljs$"  . clojurescript-mode)
;;          ("\\.edn$"   . clojure-mode))
;;   :config
;;   (use-package align-cljlet
;;     :bind (:map clojure-mode-map
;;                 ("C-! a a" . align-cljlet)
;;                 :map clojurescript-mode-map
;;                 ("C-! a a" . align-cljlet)
;;                 :map clojurec-mode-map
;;                 ("C-! a a" . align-cljlet))))

;; (use-package clj-refactor
;;   :disabled
;;   :init
;;   (defun my-clj-refactor-mode-hook ()
;;     (clj-refactor-mode 1)
;;     (yas-minor-mode 1))
;;   (add-hook 'clojure-mode-hook #'my-clj-refactor-mode-hook)
;;   (setq cljr-clojure-test-declaration "[clojure.test :refer :all]"
;;         cljr-cljs-clojure-test-declaration "[cljs.test :refer-macros [deftest is use-fixtures]]")
;;   :config
;;   (cljr-add-keybindings-with-prefix "<menu>")

;;   (add-to-list 'cljr-magic-require-namespaces
;;                '("s"  . "clojure.spec.alpha"))

;;   (add-to-list 'cljr-magic-require-namespaces
;;                '("S"  . "com.rpl.specter"))

;;   (advice-add 'cljr-add-require-to-ns :after
;;               (lambda (&rest _)
;;                 (yas-next-field)
;;                 (yas-next-field))))

;; (use-package cider
;;   :bind (:map cider-repl-mode-map
;;               ("M-r" . cider-refresh)
;;               ("M-R" . cider-use-repl-tools))
;;   :config
;;   (setq nrepl-hide-special-buffers t
;;         nrepl-popup-stacktraces-in-repl t
;;         nrepl-history-file "~/.emacs.d/nrepl-history"
;;         cider-mode-line " CIDER"
;;         cider-repl-display-in-current-window t
;;         cider-auto-select-error-buffer nil
;;         cider-repl-pop-to-buffer-on-connect nil
;;         clojure-toplevel-inside-comment-form t
;;         cider-show-error-buffer nil
;;         cider-repl-use-pretty-printing t
;;         cider-cljs-lein-repl "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")

;;   (defun cider-use-repl-tools ()
;;     (interactive)
;;     (cider-interactive-eval
;;      "(use 'clojure.repl)"))

;;   (fset 'cider-eval-last-sexp-and-comment
;;         "\C-u\C-x\C-e\C-a\260 ;; \C-e")

;;   (bind-key "C-j" 'cider-eval-last-sexp-and-comment clojure-mode-map)

;;   ;; this snippet comes from schmir https://github.com/schmir/.emacs.d/blob/master/lisp/setup-clojure.el
;;   (defadvice cider-load-buffer (after switch-namespace activate compile)
;;     "switch to namespace"
;;     (cider-repl-set-ns (cider-current-ns))
;;     (cider-switch-to-repl-buffer))

;;   ;; fix cond indenting
;;   (put 'cond 'clojure-backtracking-indent '(2 4 2 4 2 4 2 4 2 4 2 4 2 4 2 4 2 4 2 4 2 4 2 4 2 4 2 4 2 4)))

(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook #'paxedit-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)
(add-hook 'clojure-mode-hook #'subword-mode)
(add-hook 'clojure-mode-hook #'eldoc-mode)

(setq clojure-align-forms-automatically t)

(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  (yas-reload-all)
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "C-c C-m")
  )

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

(use-package clj-refactor
  :ensure t
  :config
  (defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))
  (setq cljr-warn-on-eval nil)
  :hook
  (clojure-mode . my-clojure-mode-hook))
