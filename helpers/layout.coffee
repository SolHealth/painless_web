exports.hardcode ?= {}

# HTML --

exports.hardcode.IMAGE_ROOT = 'https://s3.amazonaws.com/choir.static'
#exports.hardcode.IMAGE_ROOT = ''

# Layout --

exports.hardcode.headLayout = (_title, appUrl) ->
  link rel: 'shortcut icon', href: "#{IMAGE_ROOT}/favicon.ico"

  title (if _title then "#{_title} | PainLess" else "PainLess")

  # Mobile Meta
  meta name: "viewport", content: "initial-scale=1.0, width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"

  # Zepto isn't compatible with libraries we want to use, so sticking with jQuery
  script type: 'text/javascript', src: '//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js'

  text css 'style'

  # Hacky browser detection.
#  coffeescript ->
#    window.isFirefox = navigator.userAgent.toLowerCase().indexOf('firefox') > -1
#    window.isIOS = /(iPad|iPhone|iPod)/g.test navigator.userAgent

exports.hardcode.layout = (content) ->
  doctype 5
  html ->
    head ->
      headLayout(content?.title)
      content?.head?.apply(@)
    # NOTE: Attr translates taps to clicks.
    body ontouchstart: "", ->
      content?.body?.apply(@)
