(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(leuven-dark)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )






(global-hl-line-mode 1)

;; 设置透明度（范围 0-100，数值越小越透明）
;; (set-frame-parameter nil 'alpha '(85 85))
 ;; 第一个值是活跃时透明度，第二个是非活跃时
;; 自定义颜色（按自己主题改）
(set-face-background 'hl-line "#3e4451")
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

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


;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

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
