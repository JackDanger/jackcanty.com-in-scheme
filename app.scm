(define index (load "views/index.xml.scm"))
;; (defresource "/" (quote (html (body (h1 "Bus Scheme") ) )))
(defresource "/" 'index) 
(webwait)
