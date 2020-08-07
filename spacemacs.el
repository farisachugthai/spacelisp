;;; package --- summary
;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;;; Commentary:

;;; Code:

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.

You should not put any user code in this function besides modifying the variable
values.

Also in case you're curious about the implementation of those layers, check
`~/.emacs.d/layers/auto-layer.el'. I'm not sure what the right way to make that
file URL a link but we'll figure that out eventually I guess."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(python
     python
     python
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-idle-delay 0.2
                      auto-completion-private-snippets-directory nil
                      auto-completion-enable-snippets-in-popup nil
                      auto-completion-enable-help-tooltip nil
                      auto-completion-use-company-box nil
                      auto-completion-enable-sort-by-usage nil)
     better-defaults
     colors
     conda
     csv
     django
     emacs-lisp
     git
     helm
     helpful
     ibuffer
     ipython-notebook
     javascript
     lsp
     markdown
     org
     parinfer
     (python :variables
             python-shell-interpreter "ipython3"
             python-shell-interpreter-args "--pdb --nosep --classic"
             python-shell-prompt-regexp ">>> "
             python-shell-prompt-output-regexp ""
             python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
             python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
             python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
     react
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     sphinx
     syntax-checking
     tmux
     typescript
     version-control
     yaml)
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.

   ;; I think I'm gonna make a defun for this later
   ;; dotspacemacs-additional-packages '(elpy)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   dotspacemacs-mode-line-theme 'spacemacs

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading t
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (bookmarks . 3)
                                (todos . 3)
                                (agenda . 3)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Hack"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize t
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.04
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 50
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; (default nil)
   dotspacemacs-line-numbers '(:relative nil
                                         :disabled-for-modes dired-mode
                                         doc-view-mode
                                         markdown-mode
                                         org-mode
                                         pdf-view-mode
                                         text-mode
                                         :size-limit-kb 1000)
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "rg" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'all))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; use lsp instead
  ;; (global-company-mode t)
  (global-aggressive-indent-mode t)
  (setq auto-save-visted-mode t)
  (global-evil-matchit-mode t)
  (global-evil-mc-mode t)
  (global-evil-visualstar-mode t)
  (global-flycheck-mode t)
  (setq ediff-use-last-dir t)
  (add-hook 'lisp-interaction-mode
            (evil-cleverparens-mode t)))

(dotspacemacs/user-config)

(defun org-agenda-mods ()
  """Org-agenda.
"""

  (with-eval-after-load 'org-agenda
    (require 'org-projectile)
    (mapcar '(lambda (file)
               (when (file-exists-p file)
                 (push file org-agenda-files)))
            (org-projectile-todo-files))))

(org-agenda-mods)

(defun python-things()
  """Keybindings and settings.

Something.
  """

  (add-hook 'python-mode-hook
            (lambda ()
              (local-set-key "\C-ca" 'pytest-all)
              (local-set-key "\C-cm" 'pytest-module)
              (local-set-key "\C-c." 'pytest-one)
              (local-set-key "\C-cd" 'pytest-directory)
              (local-set-key "\C-cpa" 'pytest-pdb-all)
              (local-set-key "\C-cpm" 'pytest-pdb-module)
              (local-set-key "\C-cp." 'pytest-pdb-one))))

(python-things)

(defun use-package-examples ()
  """Pointless docstring.
"""
  (use-package term
    :bind ("C-c C-t" . term)
    (:map term-mode-map
          ("M-p" . term-send-up)
          ("M-n" . term-send-down))
    (:map term-raw-map
          ("M-o" . other-window)
          ("M-p" . term-send-up)
          ("M-n" . term-send-down)))

  ;; requires font lock set
  (setq font-lock-mode t)
  (setq global-font-lock-mode t))

(use-package-examples)

;;; next 2 sections are for yasnippet and lsp integration. so we really NEED to know that company mode
;; is on and ready to go
;; (use-package company :defer t :binds)

(defun lsp-settings()
  """Modifies the way that the LSP is initialized.

Required change to lsp-ui-doc.el
================================
Microsoft’s Python Language Server likes to replace spaces in the documentation
it returns with HTML entities.

Furthermore, there seems to be an additional misunderstanding between Emacs
lsp-mode and the MS PyLS with regard to the interpretation of markdown and
plaintext docstrings.

Both of these issues impact the blue documentation overlay, and should be worked
around by editing the lsp-ui-doc-extract function in lsp-ui-doc.el.

Right before the line with:

((gethash "kind" contents) (gethash "value" contents)) ;; MarkupContent

add the following sexp:

cpbotha: with numpy functions, e.g. np.array for example,
kind=markdown and docs are in markdown, but in default
lsp-ui-20181031 this is rendered as plaintext see
https://microsoft.github.io/language-server-protocol/specification#markupcontent

not only that, MS PyLS turns all spaces into   instances,
which we remove here this single additional cond clause fixes all
of this for hover

as if that was not enough: import pandas as pd - pandas is returned
with kind plaintext but contents markdown, whereas pd is returned
with kind markdown. fortunately, handling plaintext with the
markdown viewer still looks good, so here we are.

***NOTE:

((member (gethash "kind" contents) '("markdown" "plaintext"))
(replace-regexp-in-string " " " " (lsp-ui-doc--extract-marked-string contents)))

Emacs configuration:
Add the following to your Emacs init.el, and don’t forget to read the comments.

If you’re not yet using use-package now would be a good time to upgrade.
"""
  (use-package lsp-mode
    :ensure t
    :config

    ;; change nil to 't to enable logging of packets between emacs and the LS
    ;; this was invaluable for debugging communication with the MS Python Language Server
    ;; and comparing this with what vs.code is doing
    (setq lsp-print-io nil)

    ;; lsp-ui gives us the blue documentation boxes and the sidebar info
    (use-package lsp-ui
      :ensure t
      :config
      (setq lsp-ui-sideline-ignore-duplicate t)
      (add-hook 'lsp-mode-hook 'lsp-ui-mode))

    ;; make sure we have lsp-imenu everywhere we have LSP
    ;; (require 'lsp-imenu)
    (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

    ;; install LSP company backend for LSP-driven completion
    (use-package company-lsp
      :ensure t
      :config
      (push 'company-lsp company-backends))

    ;; dir containing Microsoft.Python.LanguageServer.dll
    (setq ms-pyls-dir (expand-file-name "~/build/python-language-server/output/bin/Release/"))

    ;; this gets called when we do lsp-describe-thing-at-point in lsp-methods.el
    ;; we remove all of the " " entities that MS PYLS adds
    ;; this is mostly harmless for other language servers
    (defun render-markup-content (kind content)
      (message kind)
      (replace-regexp-in-string " " " " content))
    (setq lsp-render-markdown-markup-content #'render-markup-content)

    ;; it's crucial that we send the correct Python version to MS PYLS, else it returns no docs in many cases
    ;; furthermore, we send the current Python's (can be virtualenv) sys.path as searchPaths
    (defun get-python-ver-and-syspath (workspace-root)
      "return list with pyver-string and json-encoded list of python search paths."
      (let ((python (executable-find python-shell-interpreter))
            (init "from __future__ import print_function; import sys; import json;")
            (ver "print(\"%s.%s\" % (sys.version_info[0], sys.version_info[1]));")
            (sp (concat "sys.path.insert(0, '" workspace-root "'); print(json.dumps(sys.path))")))
        (with-temp-buffer
          (call-process python nil t nil "-c" (concat init ver sp))
          (subseq (split-string (buffer-string) "\n") 0 2))))

    ;; I based most of this on the vs.code implementation:
    ;; https://github.com/Microsoft/vscode-python/blob/master/src/client/activation/languageServer/languageServer.ts#L219
    ;; (it still took quite a while to get right, but here we are!)
    (defun ms-pyls-extra-init-params (workspace)
      (destructuring-bind (pyver pysyspath) (get-python-ver-and-syspath (lsp--workspace-root workspace))
        `(:interpreter (
                        :properties (
                                     :InterpreterPath ,(executable-find python-shell-interpreter)
                                     ;; this database dir will be created if required
                                     :DatabasePath ,(expand-file-name (concat ms-pyls-dir "db/"))
                                     :Version ,pyver))
                       ;; preferredFormat "markdown" or "plaintext"
                       ;; experiment to find what works best -- over here mostly plaintext
                       :displayOptions (
                                        :preferredFormat "plaintext"
                                        :trimDocumentationLines :json-false
                                        :maxDocumentationLineLength 0
                                        :trimDocumentationText :json-false
                                        :maxDocumentationTextLength 0)
                       :searchPaths ,(json-read-from-string pysyspath))))

    (lsp-define-stdio-client lsp-python "python"
                             #'ffip-get-project-root-directory
                             `("dotnet" ,(concat ms-pyls-dir "Microsoft.Python.LanguageServer.dll"))
                             :extra-init-params #'ms-pyls-extra-init-params)

    ;; lsp-python-enable is created by macro above
    (add-hook 'python-mode-hook
              (lambda ()
                (lsp-python-enable)))))

;; void variable kind?
;; (lsp-settings)

(defun some-company-stuff ()
  """Might as well put a docstring.
"""
  (use-package company
    :hook 'elisp-mode))

(some-company-stuff)

(defun elpy-stuff ()
  """Configure elpy.
"""
  (use-package elpy
    :hook python-mode))

(elpy-stuff)

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(package-selected-packages
     '(yasnippet-snippets yapfify yaml-mode xterm-color ws-butler writeroom-mode winum which-key web-beautify vterm volatile-highlights vi-tilde-fringe uuidgen use-package unfill treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil toc-org tide terminal-here symon symbol-overlay string-inflection stickyfunc-enhance spaceline-all-the-icons smeargle shell-pop restart-emacs rainbow-mode rainbow-identifiers rainbow-delimiters pytest pyenv-mode py-isort prettier-js popwin pippel pipenv pip-requirements pcre2el password-generator parinfer paradox overseer orgit org-superstar org-projectile org-present org-pomodoro org-mime org-download org-cliplink org-brain open-junk-file nodejs-repl nameless mwim multi-term move-text mmm-mode markdown-toc magit-svn magit-section magit-gitflow macrostep lsp-ui lsp-python-ms lorem-ipsum livid-mode live-py-mode link-hint json-navigator json-mode js2-refactor js-doc indent-guide importmagic hybrid-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers helm-xref helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-org helm-mode-manager helm-make helm-lsp helm-ls-git helm-gtags helm-gitignore helm-git-grep helm-flx helm-descbinds helm-cscope helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ gh-md ggtags fuzzy font-lock+ flyspell-correct-helm flycheck-pos-tip flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emr elpy elisp-slime-nav ein editorconfig dumb-jump dotenv-mode diminish devdocs define-word dap-mode cython-mode csv-mode counsel-gtags conda company-anaconda column-enforce-mode color-identifiers-mode clean-aindent-mode centered-cursor-mode browse-at-remote blacken auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent ace-link ace-jump-helm-line ac-ispell)))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   )

  ;; (provide .custom-settings)
;;; .custom-settings ends here
  )

;; (provides '.spacemacs)
;;; .spacemacs ends here
