(require 'package)

;; FIX EMACS 30 MAC: Forzar parámetros de red compatibles con macOS
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(setq package-check-signature nil)

;; 1. USAR EL ESPEJO RESILIENTE DE EMACS CHINA (Clon exacto e instantáneo de GNU y MELPA)
(setq package-archives
      '(("gnu"   . "https://emacs-china.org/elpa/gnu/")
        ("melpa" . "https://emacs-china.org/elpa/melpa/")))

;; 2. Definir tu ruta personalizada de paquetes ANTES de inicializar
(setq package-user-dir
      (expand-file-name "packages" user-emacs-directory))

;; 3. Inicializar el sistema de paquetes con la ruta correcta
(package-initialize)

;; 4. FORZAR la descarga completa del índice limpio
(unless package-archive-contents
  (message "Emacs 30: Conectando con el espejo estable de Emacs-China...")
  (package-refresh-contents))

;; 5. Cargar tu configuración principal desde el archivo Org
(org-babel-load-file (expand-file-name "setup.org" user-emacs-directory))

;; Permisos y tweaks nativos habituales
(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-region 'disabled nil)
