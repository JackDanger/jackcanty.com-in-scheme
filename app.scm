(defwebapp "/.*" (lambda (env)

                  (define route (env "PATH_INFO"))
                  (if (not route)
                    (define route "/"))

                  (define headers list)
                  (define set-header (lambda (header-key header-value)
                                    (define headers (append headers (list header-key)))
                                    (define headers (append headers (list header-value)))
                                    ))
                  
                  (define contents "")
                  (define set-body (lambda (content)
                                    (define contents content)))

                  ; These can be overwritten by calling set-header later in the script
                  (set-header "Content-Type" "text/html")
                  (set-header "Cache-Control" "must-revalidate")

                  (define status "200")

                  ; Check routes and set the set-body
                  (if (= "/" route)
                    (set-body (load "views/index.xml.scm"))
                    )
                  (if (= "/javascript.js" route)
                    ( (set-header "Content-Type" "text/javascript")
                      (set-body (read "views/javascript.js")))
                    )
                  (if (= "/jquery.js" route)
                    ( (set-header "Content-Type" "text/javascript")
                      (set-body (read "views/jquery.js")))
                    )
                  (if (= "/blueprint.css" route)
                    ( (set-header "Content-Type" "text/css")
                      (set-body (read "views/blueprint.css")))
                    )
                  (if (= "/stylesheet.css" route)
                    ( (set-header "Content-Type" "text/css")
                      (set-body (read "views/stylesheet.css")))
                    )

                  ; proxy some web feeds for jquery so it doesn't run into cross-site scripting permission issues

                  (if (= "/twitter.xml" route)
                    ;; (web-get "http://twitter.com/statuses/user_timeline/3496901.atom")
                    ( (set-header "Content-Type" "application/xml")
                      (set-body (read "views/twitter.xml")))
                    )
                  (if (= "/dailyoffice.xml" route)
                    ;; (web-get "http://api.flickr.com/services/feeds/photoset.gne?set=72157600518706193&nsid=30691816@N00&lang=en-us")
                    ( (set-header "Content-Type" "application/xml")
                      (set-body (read "views/dailyoffice.xml")))
                    )

                  (list status headers contents)
                )
)

;; Call webwait so the process continues indefinitely
(webwait)
