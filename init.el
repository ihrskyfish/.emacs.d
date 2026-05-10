;; -*- lexical-binding: t; -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(manoj-dark))
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; 将 lisp/ 加入加载路径
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)


;; 确保 use-package 可用
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)

;; 清华镜像源
;; (setq package-archives '(("gnu"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                          ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
;;                          ("melpa"  . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))


;; 或中科大镜像源
;; (setq package-archives '(("gnu"    . "https://mirrors.ustc.edu.cn/elpa/gnu/")
;;                          ("nongnu" . "https://mirrors.ustc.edu.cn/elpa/nongnu/")
;;                          ("melpa"  . "https://mirrors.ustc.edu.cn/elpa/melpa/")))


(setq package-archives '(("gnu" . "https://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("nongnu" . "https://mirrors.ustc.edu.cn/elpa/nongnu/")))
(package-initialize)

;; 自动安装 use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
(package-install 'use-package)
)
(require 'use-package)




(global-hl-line-mode 1)

;; 设置透明度（范围 0-100，数值越小越透明）
;; (set-frame-parameter nil 'alpha '(85 85))
 ;; 第一个值是活跃时透明度，第二个是非活跃时
;; 自定义颜色（按自己主题改）
(set-face-background 'hl-line "#3e4451")

(defun my/toggle-transparency ()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
     nil 'alpha
     (if (eql alpha 100) '(85 50) '(100 100))))) ; 切换 85% 和 100%

(global-set-key (kbd "C-c T") 'my/toggle-transparency)

;; 开启全局相对行号
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)




;; 更改光标的样式（不能生效，解决方案见第二集）
(setq cursor-type 'bar)


(recentf-mode t)
(setq recentf-max-menu-items 10)




;;(mapc (lambda (file) (when (file-exists-p file) (message "已加载: %s" file))) user-init-file)
;; 
;; cancel welcome screen
;;(setq inhibit-startup-screen 0 )	

;;(switch-to-buffer "IHR_scratch" )

;;(add-hook 'emacs-startup-hook
;;          (lambda ()
;;            (execute-kbd-macro (kbd "C-x C-f"))))
;;
;; bug 
;;(add-hook 'emacs-startup-hook
;;          (lambda ()
;;             (execute-kbd-macro (kbd "C-x b RET C-x 1"))))
;;





(fido-mode t)           ; 或 (fido-vertical-mode t) 垂直布局
(setq completion-styles '(flex))  ; 启用模糊匹配



;; (use-package rime
  ;; :custom
  ;; (default-input-method "rime")
  ;; ;; (rime-librime-root "~/.emacs.d/librime/dist")  ;; 如果 librime 非系统安装
  ;; (rime-show-candidate 'posframe)  ;; 候选框显示方式：posframe / minibuffer / message
  ;; (rime-user-data-dir "~/.config/ibus/rime")  ;; 共享系统 Rime 配置
  ;; (rime-inline-ascii-trigger 'shift-l)  ;; Shift 切换中英文
  ;; :bind
  ;; (:map rime-mode-map
  ;;       ("C-`" . rime-send-keybinding))  ;; 发送 Rime 快捷键（如 ` 切换方案）
  ;; :config
  ;; ;; 在特定场景下自动切换到英文
  ;; (setq rime-disable-predicates
  ;;       '(rime-predicate-evil-mode-p
  ;;         rime-predicate-after-ascii-char-p
  ;;         rime-predicate-prog-in-code-p)))


;; (use-package chinese-wbim )

;; 
(use-package rime
    :ensure t
    :custom
    
    ;; (default-input-method "rime")
      (rime-user-data-dir "~/.config/ibus/rime")  ;; 共享系统 Rime 配置
  ;; (rime-librime-root "~/.emacs.d/librime/dist")  ;; 编译好的 librime 路径
      (rime-show-candidate 'popup)
  :bind
  (:map rime-mode-map
        ("C-`" . rime-send-keybinding))  ;; 发送 Rime 快捷键（如 ` 切换方案）
  ;; ( rime-send-keybinding  "C-`")  )  ;; 不行  (excute

  ("C-`" . rime-send-keybinding)
  )  ;; TUI 下用 minibuffer 显示候选

(use-package liberime
    :ensure t
      )


(use-package pyim
  :ensure t

  :demand t  ;; 立即加载，避免切换输入法时延迟
  ;; :custom
  ;; 单字模式
  :config
  (setq default-input-method "pyim")
  (setq pyim-default-scheme 'wubi)      ;; 五笔
  (setq pyim-max-word-length 1)
  (setq pyim-enable-shortcode nil)
  (setq pyim-enable-word-predict nil)
  (setq pyim-enable-auto-build-word-predict nil)
  
  ;; 界面精简
  (setq pyim-page-length 5)           ;; 单字不需要太多候选
  ;; (setq pyim-page-tooltip 'minibuffer)  ;; 或 posframe
  (setq pyim-page-tooltip 'popup)  ;; 或 posframe
  
  ;; 4. 清理已有词库缓存，重启生效
  ;; M-x pyim-dcache-delete-all-icache
  
  ;; 下载五笔词库（首次使用会自动提示，或手动执行）
  ;; M-x pyim-dcache-upgrade
  )


(use-package pyim-wbdict
  :ensure t
  :config
  (pyim-wbdict-v86-single-enable) ;; 86版单字词库（减少重码）
  )






  


  

























;; 绑定快捷键
(global-set-key (kbd "C-c b") 'insert-current-bazi)




