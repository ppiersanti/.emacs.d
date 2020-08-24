;;; CIDER stuff

;; cider cljs nRepl conf
(use-package cider
  :ensure t
  :defer t
  :config (flycheck-clojure-setup)
  (setq cider-repl-history-file ".cider-nrepl.history"))

(setq cider-cljs-lein-repl
      "(do (user/run)
           (user/browser-repl))")
;; "(do (require 'figwheel-sidecar.repl-api)
;;      (figwheel-sidecar.repl-api/start-figwheel!)
;;      (figwheel-sidecar.repl-api/cljs-repl))"




(add-hook 'cider-mode-hook #'eldoc-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)
(add-hook 'cider-repl-mode-hook #'paxedit-mode)
(add-hook 'cider-repl-mode-hook #'subword-mode)
(add-hook 'cider-repl-mode-hook #'eldoc-mode)

;;(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)  ;; does not work

(setq cider-overlays-use-font-lock t)
(setq cider-font-lock-dynamically '(macro core function var))
(setq cider-prompt-save-file-on-load 'always-save)
(setq cider-ns-save-files-on-refresh t)

(setq cider-test-show-report-on-success t)
(setq cider-repl-history-size 1000)
(setq cider-prompt-for-symbol nil)


(defun compile-and-run-main ()
  (cider-load-buffer)
  (cider-run))

(global-set-key (quote [f9]) 'cider-eval-last-sexp)


(defun cider-namespace-refresh ()
  (interactive)
  (cider-interactive-eval
   "(require 'clojure.tools.namespace.repl)
   (clojure.tools.namespace.repl/refresh)"))

(define-key clojure-mode-map (kbd "C-c C-r") 'cider-ns-refresh)
