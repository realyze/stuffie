jsdom = require 'jsdom'
fs = require 'fs'
_ = require 'underscore'
_s = require 'underscore.string'

html = fs.readFileSync("./a-b.html").toString()

jsdom.env {html: html, scripts: ['http://code.jquery.com/jquery-1.8.1.min.js']},
  (err, window) ->
    handleColumn window, "#left"
    handleColumn window, "#right"



handleColumn = (window, parentSel) ->
    $ = window.jQuery
    chunks = [[]]
    textNodes = $("#{parentSel} pre").contents().filter(-> this.nodeType == 3)
    elems = textNodes.add("#{parentSel} a, #{parentSel} span")
    elems.each (i, elem) ->
      chunks[chunks.length - 1].push $(elem)
      if _s.lines($(elem).text()).length > 1
        #console.log "chunk ends: #{$(elem).text()}"
        chunks.push []
    console.log chunks.length

    for chunk, line in chunks
      lineElems = $([])
      for elem in chunk
        lineElems = lineElems.add $(elem)
      lineElems.wrapAll "<span class='line' />"

    console.log $('body').html()

    fs.writeFile './out.html', window.document.innerHTML, (err) -> 
      if err 
        console.log 'err'
      else
        console.log 'success'
