
(defwebapp "/" (lambda (env)

                  (define route (env "PATH_INFO"))
                  (if (not route)
                    (define route "/"))

                  (define headers list)
                  (define header (lambda (key value)
                                    (define headers (append headers (list key)))
                                    (define headers (append headers (list value)))
                                    ))

                  ; These can be overwritten by calling header later in the script
                  (header "Content-Type" "text/html")
                  (header "Cache-Control" "must-revalidate")

                  (define status "200")

                  ; Check routes and set the body
                  (define body
                    (if (= "/" route)
                      (read "views/index.xml.scm")
                      )
                    (if (= "/javascript.js" route)
                      (read "views/javascript.js")
                      (header "Content-Type" "text/javascript")
                      )
                    (if (= "/jquery.js" route)
                      (read "views/jquery.js")
                      (header "Content-Type" "text/javascript")
                      )
                    (if (= "/blueprint.css" route)
                      (read "views/blueprint.css")
                      (header "Content-Type" "text/css")
                      )
                    (if (= "/stylesheet.css" route)
                      (read "views/stylesheet.css")
                      (header "Content-Type" "text/css")
                      )

                    ; proxy some web feeds for jquery so it doesn't run into cross-site scripting permission issues

                    (if (= "/twitter.xml" route)
                      ;; (web-get "http://twitter.com/statuses/user_timeline/3496901.atom")
                      (read "views/twitter.xml")
                      (header "Content-Type" "application/xml")
                      )
                    (if (= "/dailyoffice.xml" route)
                      ;; (web-get "http://api.flickr.com/services/feeds/photoset.gne?set=72157600518706193&nsid=30691816@N00&lang=en-us")
                      (read "views/dailyoffice.xml")
                      (header "Content-Type" "application/xml")
                      )
                    )

                  (cons status (cons headers (cons body)))
                )
)

;; Call webwait so the process continues indefinitely
(webwait)
