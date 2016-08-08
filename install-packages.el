; list the packages 
(setq package-list '(cider
		     ido-ubiquitous
		     smex
		     company
		     undo-tree))

;; repositories
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	;;        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

;; activate all the packages (in particular autoloads)
(package-initialize)

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

