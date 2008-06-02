
(defresource "/" (load "views/index.xml.scm"))

;; make some css and js resources available
(defresource "/javascript.js" (lambda (env) (read "views/javascript.js")) "Content-Type" "text/javascript")
(defresource "/jquery.js" (read "views/jquery.js") "Content-Type" "text/javascript")
(defresource "/blueprint.css" (read "views/blueprint.css") "Content-Type" "text/css")
(defresource "/stylesheet.css" (read "views/stylesheet.css") "Content-Type" "text/css")

;; proxy some web feeds for jquery so it doesn't run into cross-site scripting permission issues
;; (defresource "/twitter.xml" (web-get "http://twitter.com/statuses/user_timeline/3496901.atom") "Content-Type" "application/atom+xml")
;(defresource "/dailyoffice.xml" (web-get "http://api.flickr.com/services/feeds/photoset.gne?set=72157600518706193&nsid=30691816@N00&lang=en-us") "Content-Type" "applications/xml")
(defresource "/dailyoffice.xml" (read "views/dailyoffice.xml") "Content-Type" "application/xml")

;; Call webwait so the process continues indefinitely
(webwait)
