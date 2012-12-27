;; -*- mode: common-lisp; coding: gbk -*-

(in-package :cl-user)

;; a patch for aodbc: ������ʧ�ܵ�ʱ��Ͳ����ٵ����Ի����ˣ�
(def-fwrapper sqldriverconnect-with-no-prompt-wrapper-func
    (hdbc hwnd in-connection-string length-in-string out-connection-string length-out-string return-length completion-mode)
  (setq completion-mode dbi::sql_driver_noprompt)             
  (call-next-fwrapper))
(fwrap 'dbi::sqldriverconnect 'sqldriverconnect-with-no-prompt 'sqldriverconnect-with-no-prompt-wrapper-func)
