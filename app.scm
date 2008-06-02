(defwebapp "/javascript.js"   (lambda (env) (list 200 (quote ("Content-Type" "text/javascript")) (read "views/javascript.js"))))
(defwebapp "/jquery.js"       (lambda (env) (list 200 (quote ("Content-Type" "text/javascript")) (read "views/jquery.js"))))
(defwebapp "/blueprint.css"   (lambda (env) (list 200 (quote ("Content-Type" "text/css"))        (read "views/blueprint.css"))))
(defwebapp "/stylesheet.css"  (lambda (env) (list 200 (quote ("Content-Type" "text/css"))        (read "views/stylesheet.css"))))

; http://api.flickr.com/services/feeds/photoset.gne?set=72157605182324135&nsid=30691816@N00&lang=en-us&format=rss_200
(defwebapp "/dailyoffice.xml" (lambda (env) (list 200 (quote ("Content-Type" "application/xml")) (read "views/dailyoffice.xml"))))
(defwebapp "/twitter.xml"     (lambda (env) (list 200 (quote ("Content-Type" "application/xml")) (read "views/twitter.xml"))))

(defresource  "/" (load "views/index.xml.scm"))

;; Call webwait so the process continues indefinitely
(webwait)
