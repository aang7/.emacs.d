(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-blinks 0)
 '(cursor-type (quote box))
 '(display-time-mode t)
 '(electric-pair-preserve-balance nil)
 '(flycheck-checkers
   (quote
    (ada-gnat asciidoc c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint d-dmd emacs-lisp-checkdoc erlang eruby-erubis fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck go-unconvert groovy haml handlebars haskell-stack-ghc haskell-ghc haskell-hlint html-tidy jade javascript-eslint javascript-jshint javascript-gjslint javascript-jscs javascript-standard json-jsonlint json-python-json less lua-luacheck lua perl perl-perlcritic php php-phpmd php-phpcs processing puppet-parser puppet-lint python-flake8 python-pylint python-pycompile r-lintr racket rpm-rpmlint markdown-mdl rst-sphinx rst ruby-rubocop ruby-rubylint ruby ruby-jruby rust-cargo rust sass scala scala-scalastyle scheme-chicken scss-lint scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim slim-lint sql-sqlint tex-chktex tex-lacheck texinfo typescript-tslint verilog-verilator xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby)))
 '(font-use-system-font nil)
 '(ido-mode (quote both) nil (ido))
 '(jedi:get-in-function-call-delay 500)
 '(org-latex-minted-langs
   (quote
    ((emacs-lisp "common-lisp")
     (cc "c++")
     (cperl "perl")
     (caml "ocaml")
     (ESS "r")
     (java "java")
     (Fortan "fortran"))))
 '(org-latex-minted-options
   (quote
    (("breaklines" "true")
     ("breakautoindent" "true")
     ("bgcolor" "bg"))))
 '(org-latex-pdf-process
   (quote
    ("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f" "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f")))
 '(org-reveal-plugins (quote (classList markdown zoom notes)))
 '(org-support-shift-select t)
 '(safe-local-variable-values (quote ((org-confirm-babel-evaluate))))
 '(server-mode nil)
 '(show-paren-mode t)
 '(sml/mode-width (quote full))
 '(term-buffer-maximum-size 0)
 '(term-input-chunk-size 0)
 '(tool-bar-mode nil))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 111 :width normal :foundry "unknown"))))
 '(cursor ((t (:background "tomato1" :foreground "#151718"))))
 '(hl-line ((t (:background "#280029"))))
 '(show-paren-match ((t (:background "lawn green" :foreground "black")))))
;;'(ido-first-match ((t (:box (:line-width 2 :color "dark slate gray" :style released-button) :weight extra-bold))))
 ;;'(mode-line ((t (:background "OliveDrab4" :foreground "black" :box nil :underline "#4F99D3"))))
 ;;'(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil))))

(put 'downcase-region 'disabled nil)


