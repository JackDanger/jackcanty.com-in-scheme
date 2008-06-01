
(defresource "/" (load "views/index.xml.scm")) 

;; make some css and js resources available
(defresource "/javascript.js" (read "views/javascript.js"))
(defresource "/stylesheet.css" (read "views/stylesheet.css"))

;; proxy some web feeds for jquery so it doesn't run into cross-site scripting permission issues
(defresource "/twitter.xml" (web-get "http://twitter.com/statuses/user_timeline/3496901.atom"))
(defresource "/dailyoffice.xml" (web-get "http://api.flickr.com/services/feeds/photos_public.gne?id=30691816@N00&tags=dailyoffice&lang=en-us&format=rss_200"))

;; Call webwait so the process continues indefinitely
(webwait)
