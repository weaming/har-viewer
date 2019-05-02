div.log
  div.meta
    h2.title Meta
    div.version
      div.name Version
      div.value #{log.version}
    - if xx = log.creator
      div.creator
        div.productname
          div.name Name
          div.value #{xx.name}
        div.version
          div.name Version
          div.value #{xx.version}
        - if xx.comment
          div.comment
            div.name Commment
            pre.comment.value #{xx.comment}
    div.browser #{log.browser}
    - if log.comment
      pre.comment #{log.comment}
  - if pg = log.pages
    div.pages
      h3.title Pages
      - pg.each do |x|
        div.startedDateTime #{x.startedDateTime}
        div.id #{x.id}
        h4.title #{x.title}
        - if pt = x.pageTimings
          div.onContentLoad #{pt.onContentLoad}
          div.onLoad #{pt.onLoad}
          - if pt.comment
            pre.comment #{pt.comment}
        - if x.comment
          div.comment
            div.name Comment
            pre.comment.value #{x.comment}
  div.entries
    h2.title Entries
    - log.entries.each do |x|
      div.entry
        - req = x.request
        - res = x.response
        div.request
          h3.title Request
          div.general
            h4.title General
            div.method
              div.name Method
              div.value #{req.method}
            div.url
              div.name URL
              div.value #{req.url}
            div.httpVersion
              div.name HTTP Version
              div.value #{req.httpVersion}
            div.responseStatus
              div.name Status Code
              div.value #{res.status}
            div.headersSize
              div.name Headers Size
              div.value #{req.headersSize}
            div.bodySize
              div.name Body Size
              div.value #{req.bodySize}
            - if req.comment
              div.comment
                div.name Comment
                pre.comment.value #{req.comment}
          div.queries
            h4.title Queries
            - req.queryString.each do |xx|
              div.query
                div.name #{xx.name}
                div.value #{xx.value}
                - if xx.comment
                  div.comment
                    div.name Commment
                    pre.comment.value #{xx.comment}
          - if req.fragments
            div.fragments
              h4.title Fragments
              - req.fragments.not_nil!.each do |xx|
                div.fragment #{xx}
          div.headers
            h4.title Headers
            - req.headers.each do |xx|
              div.header
                div.name #{xx.name}
                div.value #{xx.value}
                - if xx.comment
                  div.comment
                    div.name Commment
                    pre.comment.value #{xx.comment}
          - if req.postData
            div.postData
              h4.title PostData
              div.mimeType #{req.postData}
        div.response
          h3.title Response
          div.general
            h4.title General
            div.status #{res.status}
            div.statusText #{res.statusText}
            div.httpVersion #{res.httpVersion}
            div.redirectURL #{res.redirectURL}
            div.headersSize #{req.headersSize}
            div.bodySize #{req.bodySize}
          - if res.cookies
            div.cookies
              h4.title Cookies
              - res.cookies.each do |xx|
                div.cookie
                  div.name #{xx.name}
                  div.value #{xx.value}
                  div.path #{xx.path}
                  div.domain #{xx.domain}
                  div.expires #{xx.expires}
                  div.httpOnly #{xx.httpOnly}
                  div.secure #{xx.secure}
                  - if xx.comment
                    div.comment
                      div.name Commment
                      pre.comment.value #{xx.comment}
          div.headers
            h4.title Headers
            - res.headers.each do |xx|
              div.header
                div.name #{xx.name}
                div.value #{xx.value}
                - if xx.comment
                  div.comment
                    div.name Commment
                    pre.comment.value #{xx.comment}
          div.content
            - c = res.content
            h4.title Content
            div.size
              div.name Size
              div.value #{c.size}
            div.compression
              div.name Compression
              div.value #{c.compression}
            div.mimeType
              div.name MIME Type
              div.value #{c.mimeType}
            div.encoding
              div.name Encoding
              div.value #{c.encoding}
            - if c.comment
              div.comment
                div.name Commment
                pre.comment.value #{c.comment}
            div.text
              h5.title Text
              pre.text #{c.text}
            - if c.mimeType == "application/json" && c.text
              - if txt = c.text
                div.json
                  h5.title JSON
                  pre.json #{JSON.parse(txt).to_pretty_json   }
