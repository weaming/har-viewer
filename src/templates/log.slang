div.log.container
  div.columns
    div.column.col-2.hide-md.p-sticky
      - log.entries.size.times do |i|
        - if x = log.entries[i]?
          ul.nav
            li.nav-item
              a.float-right.label.label-rounded href="##{i+1}" #{URI.parse(x.request.url).host} #{i+1}
    div.column.col-9.col-md-12
      div.container
        div.columns
          h1.column.col-12 #{@path}

          div.column.col-12
            h2 Meta

            div.btn-group
              button.btn.btn-primary version
              button.btn #{log.version}
            - if xx = log.creator
              div.btn-group
                button.btn.btn-primary creator.name
                button.btn #{xx.name}
              div.btn-group
                button.btn.btn-primary creator.version
                button.btn #{xx.version}
              - if xx.comment
                div.btn-group
                  button.btn.btn-primary creator.comment
                  button.btn #{xx.comment}
            - if log.browser
              div.btn-group
                button.btn.btn-primary browser
                button.btn #{log.browser}
            - if log.comment
              div.btn-group
                button.btn.btn-primary comment
                button.btn #{log.comment}
            - if pg = log.pages
              h3 Pages
              div.card-body
                - pg.each do |x|
                  div.card.col-12
                    div.card-body
                      div.btn-group
                        button.btn.btn-primary startedDateTime
                        button.btn #{x.startedDateTime}
                      div.btn-group
                        button.btn.btn-primary id
                        button.btn #{x.id}
                      div.btn-group
                        button.btn.btn-primary title
                        button.btn #{x.title}
                      - if pt = x.pageTimings
                        div.btn-group
                          button.btn.btn-primary timings.onContentLoad
                          button.btn #{pt.onContentLoad}
                        div.btn-group
                          button.btn.btn-primary timings.onLoad
                          button.btn #{pt.onLoad}
                        - if pt.comment
                          div.btn-group
                            button.btn.btn-primary timings.comment
                            button.btn #{pt.comment}
                      - if x.comment
                        div.btn-group
                          button.btn.btn-primary comment
                          button.btn #{x.comment}

          div.column.col-12
            div.divider.text-center data-content="Following are entries"

          div.column.col-12
            h2 Entries
              div.container
                div.columns
                  - log.entries.size.times do |i|
                    - if x = log.entries[i]?
                      div.column.col-12
                        div.entry.card.s-rounded.m-2 id="#{i+1}"
                          - req = x.request
                          - res = x.response

                          div.card-header
                            h3.label.label-primary.label-rounded ##{i+1} #{URI.parse(req.url).host}

                          div.card-body
                            div.divider.text-center data-content="Request"
                            div.request
                              h4 Request
                              div.general
                                h5 General
                                div.btn-group
                                  button.btn.btn-primary method
                                  button.btn #{req.method}
                                div.btn-group
                                  button.btn.btn-primary url
                                  button.btn #{req.url}
                                div.btn-group
                                  button.btn.btn-primary version
                                  button.btn #{req.httpVersion}
                                div.btn-group
                                  button.btn.btn-primary status
                                  button.btn #{res.status}
                                div.btn-group
                                  button.btn.btn-primary headers size
                                  button.btn #{req.headersSize}
                                div.btn-group
                                  button.btn.btn-primary body size
                                  button.btn #{req.bodySize}
                                - if req.comment
                                  div.btn-group
                                    button.btn.btn-primary comment
                                    button.btn #{req.comment}

                              - if req.queryString.size > 0
                                div.queries
                                  h5 Queries
                                  - req.queryString.each do |xx|
                                    div.btn-group
                                      button.btn.btn-primary #{xx.name}
                                      button.btn #{xx.value}
                                    - if xx.comment
                                      div.btn-group
                                        button.btn.btn-primary #{xx.comment}
                                        button.btn #{xx.comment}

                              - if req.fragments
                                div.fragments
                                  h5 Fragments
                                  - req.fragments.not_nil!.each do |xx|
                                    div.btn-group
                                      button.btn.btn-primary
                                      button.btn #{xx}

                              div.headers
                                h5 Headers
                                - req.headers.each do |xx|
                                  div.btn-group
                                    button.btn.btn-primary #{xx.name}
                                    button.btn #{xx.value}
                                  - if xx.comment
                                    button.btn #{xx.comment}

                              - if req.postData
                                div.postData
                                  h5 PostData
                                  pre #{req.postData}

                            div.divider.text-center data-content="Response"
                            div.response
                              h4 Response
                              div.general
                                div.btn-group
                                  button.btn.btn-primary status
                                  button.btn #{res.status}

                                div.btn-group
                                  button.btn.btn-primary version
                                  button.btn #{res.httpVersion}

                                - if res.statusText != ""
                                  div.btn-group
                                    button.btn.btn-primary statusText
                                    button.btn #{res.statusText}

                                - if res.redirectURL != ""
                                  div.btn-group
                                    button.btn.btn-primary redirect
                                    button.btn #{res.redirectURL}

                                div.btn-group
                                  button.btn.btn-primary headers size
                                  button.btn #{res.headersSize}

                                div.btn-group
                                  button.btn.btn-primary body size
                                  button.btn #{res.bodySize}

                              - if res.cookies.size > 0
                                div.cookies
                                  h5 Cookies
                                  - res.cookies.each do |xx|
                                    div.btn-group
                                      button.btn.btn-primary name
                                      button.btn #{xx.name}

                                    div.btn-group
                                      button.btn.btn-primary value
                                      button.btn #{xx.value}

                                    div.btn-group
                                      button.btn.btn-primary path
                                      button.btn #{xx.path}

                                    div.btn-group
                                      button.btn.btn-primary domain
                                      button.btn #{xx.domain}

                                    div.btn-group
                                      button.btn.btn-primary expires
                                      button.btn #{xx.expires}

                                    div.btn-group
                                      button.btn.btn-primary httpOnly
                                      button.btn #{xx.httpOnly}

                                    div.btn-group
                                      button.btn.btn-primary secure
                                      button.btn #{xx.secure}

                                    - if xx.comment
                                      div.btn-group
                                        button.btn.btn-primary comment
                                        button.btn #{xx.comment}

                              div.headers
                                h5 Headers
                                - res.headers.each do |xx|
                                  div.btn-group
                                    button.btn.btn-primary #{xx.name}
                                    button.btn #{xx.value}

                                  - if xx.comment
                                    div.btn-group
                                      button.btn.btn-primary comment
                                      button.btn #{xx.comment}

                              - c = res.content
                              - if c.size.not_nil! > 0
                                div.content
                                  h5 Content
                                  div.btn-group
                                    button.btn.btn-primary size
                                    button.btn #{c.size}

                                  - if c.compression
                                    div.btn-group
                                      button.btn.btn-primary compression
                                      button.btn #{c.compression}

                                  div.btn-group
                                    button.btn.btn-primary mime type
                                    button.btn #{c.mimeType}

                                  - if c.encoding
                                    div.btn-group
                                      button.btn.btn-primary encoding
                                      button.btn #{c.encoding}

                                  - if c.comment
                                    div.btn-group
                                      button.btn.btn-primary comment
                                      button.btn #{c.comment}

                                  div.text
                                    h6 Text
                                    textarea.form-input style="height: 20em;" #{c.text}
                                  - if c.mimeType == "application/json" && c.text
                                    - if txt = c.text
                                      div.json
                                        h6 JSON
                                        pre.json.bg-gray.p-1 #{JSON.parse(txt).to_pretty_json   }

    div.column.col-1.hide-md
