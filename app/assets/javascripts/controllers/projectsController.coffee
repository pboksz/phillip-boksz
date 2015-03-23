$ ->
  $('.footer a').on 'click', (event) ->
    event.preventDefault()
    if projectId = $(event.currentTarget).attr('href')
      offset = $(projectId).offset().top
      $('html, body').animate { scrollTop: offset }, 200, 'linear', ->
        $(projectId).focus()

  startTouch = null
  window.addEventListener 'touchstart', (event) ->
    startTouch = event.targetTouches[0].screenY

  window.addEventListener 'touchend', (event) ->
    if project = $(event.srcElement).closest('.project')
      endTouch = event.changedTouches[0].screenY
      if startTouch < endTouch
        switchProject(project, 'prev')
      else if startTouch > endTouch
        switchProject(project, 'next')

  # Webkit
  window.addEventListener 'mousewheel', (event) ->
    if project = $(event.srcElement).closest('.project')
      if event.wheelDelta > 0 # mouse wheel up
        switchProject(project, 'prev')
      else if event.wheelDelta < 0 # mouse wheel down
        switchProject(project, 'next')

  # Firefox
  window.addEventListener 'DOMMouseScroll', (event) ->
    if project = $(event.target).closest('.project')
      if event.detail < 0 # mouse wheel up
        switchProject(project, 'prev')
      else if event.detail > 0 # mouse wheel down
        switchProject(project, 'next')

  $('.project').keydown (event) ->
    if project = $(event.currentTarget).closest('.project')
      if event.which == 38 # up arrow
        switchProject(project, 'prev')
      else if event.which == 40 # down arrow
        switchProject(project, 'next')

switchProject = (project, type) ->
  button = project.find(".footer .#{type}").get(0)
  button.click() if button
