;; -*- lexical-binding: t; -*-
(require 'package)

;; Configurar certificados y timeouts para el espejo de Emacs China
;(setq gnutls-algorithm-priority "NORMAL")
;(setq url-http-attempt-keep-alives nil)

;; Repositorios usando el espejo oficial de Emacs China
;; Lista de repositorios: Emacs-China (primero) + Repositorios Oficiales (respaldo)
(setq package-archives
      '(("melpa-china" . "http://emacs-china.org/elpa/melpa/")
        ("gnu-china"   . "http://emacs-china.org/elpa/gnu/")
        ("melpa"       . "https://melpa.org/packages/")
        ("gnu"         . "https://elpa.gnu.org/packages/")
        ("nongnu"      . "https://elpa.nongnu.org/nongnu/")))

;; Definir tu ruta personalizada de paquetes
(setq package-user-dir
      (expand-file-name "packages" user-emacs-directory))

;; Inicializar el sistema de paquetes
;; `treesit-ready-p' no está autoloaded, pero los autoloads generados de
;; `astro-ts-mode' lo llaman a nivel superior.  Cargar `treesit' antes de
;; `package-initialize' evita el error "void-function treesit-ready-p".
(require 'treesit)
(package-initialize)

;; Forzar la descarga del índice si está vacío
(unless package-archive-contents
  (message "Conectando con Emacs-China...")
  (package-refresh-contents))

;; Cargar tu configuración principal desde Org
(org-babel-load-file (expand-file-name "setup.org" user-emacs-directory))

;; Permisos nativos
(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-region 'disabled nil)
