layout
  head: ->
    # TODO
  body: ->
    div '.section.white', ->
      div '.contain', ->
        div '.phone.cutoff.right', ->
          div '.screens', ->
            div '.screen.days', ''
        header ->
          h1 -> 'Understand your pain.'
        p 'Discover how to manage fibromyalgia.'
        a '.button', href: '#', 'Get the Free App'
    div '#features.section', ->
      div '.contain', ->
        header -> h2 'What does PainLess do?'
        div '.h-separator', ''
      div '.contain', ->
        div '.phone.left', ->
          div '.screens', ->
            div '.screen.day', ''
        h3 'TRACK'
        p 'Easily log your pain and activities that affect it.'
      div '.contain', ->
        div '.phone.right', ->
          div '.screens', ->
            div '.screen.days', ''
        h3 'UNDERSTAND'
        p 'Get insights into what affects your pain.'
      div '.contain', ->
        center ->
          a '.button', href: '#', 'Get the Free App'
