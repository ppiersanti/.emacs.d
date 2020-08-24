;;; inf clojure settings

(add-hook 'clojure-mode-hook #'inf-clojure-minor-mode)
(add-hook 'inf-clojure-mode-hook #'eldoc-mode)
(global-set-key (quote [f9]) 'inf-clojure-eval-last-sexp)
