;; -*- mode: common-lisp; coding: gbk -*-

(in-package :cl-user)

;; a patch for aodbc: 在连接失败的时候就不会再弹出对话框了！
(def-fwrapper sqldriverconnect-with-no-prompt-wrapper-func
    (hdbc hwnd in-connection-string length-in-string out-connection-string length-out-string return-length completion-mode)
  (setq completion-mode dbi::sql_driver_noprompt)             
  (call-next-fwrapper))
(fwrap 'dbi::sqldriverconnect 'sqldriverconnect-with-no-prompt 'sqldriverconnect-with-no-prompt-wrapper-func)
