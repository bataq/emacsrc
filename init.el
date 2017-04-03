;;emacs設定ファイル
;;

;;行数表示
(global-linum-mode t)

;;透過
;(add-to-list 'default-frame-alist '(alpha .85))
;(set-cursor-color "LightBlue")
;(set-frame-parameter nil 'alpha 85)

;;括弧強調
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)

;;文字サイズ
(set-face-attribute 'default nil :height 140)

;; 選択領域の色
(set-face-background 'region "#555")
(set-face-background 'show-paren-match-face "#259")

;;スタートアップメッセージを非表示
(setq inhibit-startup-message t)
;; ビープ音無効化
(setq visible-bell t)
(setq ring-bell-function 'ignore)
;;開始時1画面
(setq inhibit-startup-message t)
;;開始時白紙
(setq initial-scratch-message nil)

;; ツールバー非表示
(tool-bar-mode 0)
;;メニューバー非表示
(menu-bar-mode 0)

;;クリップボードにコピー
;(cond (window-system
 ;      (setq x-select-enable-clipboard t)
  ;     ))
;;スクロールバー非表示
(set-scroll-bar-mode 'nil)

;;ps-print-bufferの日本語文字化け止め
(setq ps-multibyte-buffer 'non-latin-printer)
(require 'ps-mule)
(defalias 'ps-mule-header-string-charsets 'ignore)

;;やじるしキーで分割画面を移動
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <right>") 'windmove-right)

;----------------------------------------------------------------
;; add package list
;----------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;----------------------------------------------------------------
;; auto-complete
;;---------------------------------------------------------------
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'load-path
	     "~/.emacs.d/elpa/yasnippet-20151212.2133/")
(require 'yasnippet)
(yas-global-mode 1)
;; auto-complete-c-headers
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook ' my:ac-c-header-init)
;;----------------
;; Auto Complete
;;----------------
;(require 'auto-complete-config)
;(ac-config-default)
;(add-to-list 'ac-modes 'text-mode)         ;; text-modeでも自動的に有効にする
;(add-to-list 'ac-modes 'fundamental-mode)  ;; fundamental-mode
;(add-to-list 'ac-modes 'org-mode)
;(add-to-list 'ac-modes 'yatex-mode)
;(ac-set-trigger-key "TAB")
;(setq ac-use-menu-map t)       ;; 補完メニュー表示時にC-n/C-pで補完候補選択
;(setq ac-use-fuzzy t)          ;; 曖昧マッチ

;----------------------------------------------------------------
;; back-up
;;---------------------------------------------------------------
;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

;----------------------------------------------------------------
;; キーバインド
;----------------------------------------------------------------
(define-key global-map (kbd "C-z") 'undo)                 ; undo

;(when (require 'redo+ nil t)
 ; (define-key global-map (kbd "C-/") 'redo))                ; redo ->redo+.elが必要
(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "M-/") 'undo-tree-redo)

;;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)
;; C-hをバックスペースに
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)
;---------------------------------------------------------------
;; expand-region
;---------------------------------------------------------------
(transient-mark-mode t)					;
(require 'expand-region)
;; リージョンを広げる
(global-set-key (kbd "C-@") 'er/expand-region)
;; リージョンを狭める
(global-set-key (kbd "C-M-@") 'er/contract-region)

;---------------------------------------------------------------
;; pdf-preview
;---------------------------------------------------------------
;(setq ps-multibyte-buffer 'non-latin-printer)
;(require 'ps-mule)
;(defalias 'ps-mule-header-string-charsets 'ignore)
;(require 'pdf-preview)
;(setq pdf-preview-preview-command "open -a Preview.app")

;---------------------------------------------------------------
;; package取得先
;---------------------------------------------------------------

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;---------------------------------------------------------------
;;ROOT
;---------------------------------------------------------------
;;->root-help.elは/usr/share/emacs/site-lispに置いた。
(add-to-list 'load-path "~/.emacs.d/elisp/")
(require 'root-help)

;---------------------------------------------------------------
;;YaTeX
;---------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/yatex")

;---------------------------------------------------------------
;;highlight symbol
;---------------------------------------------------------------
(require 'highlight-symbol)
(setq highlight-symbol-colors '("LightSeaGreen" "HotPink" "SlateBlue1" "DarkOrange" "SpringGreen1" "tan" "DodgerBlue1"))
(global-set-key (kbd "C-x C-l") 'highlight-symbol-at-point)


;---------------------------------------------------------------
;;rainbow-delimiters
;---------------------------------------------------------------
(when (require 'rainbow-delimiters nil 'noerror)
  (add-hook 'lisp-interaction-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode))
(set-face-foreground 'rainbow-delimiters-depth-1-face "SlateBlue2")
(set-face-foreground 'rainbow-delimiters-depth-2-face "DarkOliveGreen2")
(set-face-foreground 'rainbow-delimiters-depth-3-face "CornflowerBlue")
(set-face-foreground 'rainbow-delimiters-depth-4-face "khaki2")
(set-face-foreground 'rainbow-delimiters-depth-4-face "PaleGreen2")
(set-face-foreground 'rainbow-delimiters-depth-5-face "DarkSlateGray2")
(set-face-foreground 'rainbow-delimiters-depth-6-face "LightSalmon2")
(set-face-foreground 'rainbow-delimiters-depth-7-face "magenta2")
(set-face-foreground 'rainbow-delimiters-depth-8-face "IndianRed4")
(set-face-foreground 'rainbow-delimiters-depth-9-face "DeepPink3")

;---------------------------------------------------------------
;;solarized-theme
;---------------------------------------------------------------
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(load-theme 'solarized t) ;; (load-theme 'solarized-light t)
(set-terminal-parameter nil 'background-mode 'dark)

;---------------------------------------------------------------
;;twitting-mode
;---------------------------------------------------------------
(require 'twittering-mode)
