(require 'pallet)
(pallet-mode t)

;; To get rid of Weird color escape sequences in Emacs.
;; Instruct Emacs to use emacs term-info not system term info
;; http://stackoverflow.com/questions/8918910/weird-character-zsh-in-emacs-terminal
(setq system-uses-terminfo nil)

;; Prefer utf-8 encoding
(prefer-coding-system 'utf-8)

;; Display continuous lines
(setq-default truncate-lines nil)
;; Do not use tabs for indentation
(setq-default indent-tabs-mode t)
(setq c-basic-indent 2)
(setq js-indent-level 2
      indent-tabs-mode t)
(setq tab-width 2)

(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)

;; set keys for Apple Keyboard
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)
(setq mac-control-modifier 'control)
(setq ns-function-modifier 'hyper)


(require 'solarized-theme)
(load-theme 'solarized-dark t)

;; trucate even even when screen is split into multiple windows
(setq-default truncate-partial-width-windows nil)

;; y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

(set-cursor-color "red")

(setq default-frame-alist
      '((cursor-color . "red")))

;; Highlight incremental search
(setq search-highlight t)
(transient-mark-mode t)

(global-visual-line-mode 1)

(display-time)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;(scroll-bar-mode nil)

;; Enable copy and pasting from clipboard
(setq x-select-enable-clipboard t)
;; Disable backups
(setq backup-inhibited t)
;;disable auto save
(setq auto-save-default nil)
(global-linum-mode 1)
(global-set-key "\C-x\C-m" 'compile)

;;(set-frame-parameter nil 'fullscreen 'fullboth)

;; ivy completion deprecates ido
(require 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-count-format "(%d/%d) ")
;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)

(require 'org)
;; set key for agenda
(global-set-key (kbd "C-c a") 'org-agenda)
;;file to save TODO items
(setq org-agenda-files (quote ("/Users/lfurrea/dev/todo.org")))
;; set priority range from A to C with default A
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?B)
;; set colors for priority
(setq org-priority-faces '((?A . (:foreground "#F0DFAF"))
                           (?B . (:foreground "#LightSteelBlue"))
                           (?C . (:foreground "#OliveDrab"))
                           ))
;;open agenda in current window
(setq org-agenda-window-setup (quote current-window))
;;capture todo items using C-c c t
(define-key global-map (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(("t" "todo" entry (file+headline "/Users/lfurrea/dev/todo.org" "Tasks")
         "* TODO [#A] %?")))

;;Projectile
(require 'grizzl)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'ivy)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; Press Command-p for fuzzy find in project
;;(global-set-key (kbd "s-p") 'projectile-find-file)
;; Press Command-b for fuzzy switch buffer
;;(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)
;;(define-key projectile-mode-map [?\s-g] 'projectile-grep)

;; Smartparens
(require 'smartparens-config)
(add-hook 'elixir-mode-hook #'smartparens-mode)
;; Run elixir-format on save
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

;;Indentation-mode
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#e3e3d3")
(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")
(add-hook 'enh-ruby-mode-hook
	  (lambda () (highlight-indentation-current-column-mode)))

(add-hook 'coffee-mode-hook
	  (lambda () (highlight-indentation-current-column-mode)))

(add-hook 'erlang-mode
	  (lambda () (highlight-indentation-current-column-mode)))

(add-hook 'shell-script-mode
	  (lambda () (highlight-indentation-current-column-mode)))

;; Elixir mode
(require 'elixir-mode)

;; Erlang mode
;;(add-to-list 'load-path "/usr/local/lib/erlang/lib/tools-2.8.1/emacs")
;;(require 'erlang-start)

;;(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
;;(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

;;(setq erlang-root-dir "/usr/local/lib/erlang/lib")
;;(add-to-list 'exec-path "/usr/local/lib/erlang/bin")

;;Edts mode
;;(add-hook 'after-init-hook 'my-after-init-hook)
;;(defun my-after-init-hook ()
;;(require 'edts-start))

;;Markdown mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(setq markdown-command "/usr/local/bin/multimarkdown")
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;;;Magit mode
;;(require 'magit)
;;(global-set-key (kbd "C-x g") 'magit-status)

;;Scala ensime
;;(require 'ensime)
;;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;;Dockerfile mode
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; Github Gists
(require 'gist)

;;Godoc fetch doumentation from packages
(setenv "GOPATH" "/Users/luisurrea/dev/go")
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

;; Gofmt on save
(add-to-list 'exec-path "/Users/luisurrea/dev/go/bin")
(add-hook 'before-save-hook 'gofmt-before-save)

;; Go compile
(defun my-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go vet"))
  )
(add-hook 'go-mode-hook 'my-go-mode-hook)
