$ ->
  $('.move a').on 'click', (event) ->
    event.preventDefault()
    nextProjectId = $(event.currentTarget).attr('href')
    if nextProjectId != '#'
      offset = $(nextProjectId).offset().top
      $('html, body').animate { scrollTop: offset }, 500, ->
        $(nextProjectId).focus()

  startTouch = null
  window.addEventListener 'touchstart', (event) ->
    startTouch = event.targetTouches[0].screenY

  window.addEventListener 'touchend', (event) ->
    if project = $(event.srcElement).closest('.project')
      endTouch = event.changedTouches[0].screenY
      if startTouch < endTouch
        prevProject(project)
      else if startTouch > endTouch
        nextProject(project)

  window.addEventListener 'mousewheel', (event) ->
    if project = $(event.srcElement).closest('.project')
      if event.wheelDelta > 0 # mouse wheel up
        prevProject(project)
      else if event.wheelDelta < 0 # mouse wheel down
        nextProject(project)

  $('.project').keydown (event) ->
    if project = $(event.currentTarget).closest('.project')
      if event.which == 38 # up arrow
        prevProject(project)
      else if event.which == 40 # down arrow
        nextProject(project)

prevProject = (project) ->
  project.find('.move .prev').get(0).click()

nextProject = (project) ->
  project.find('.move .next').get(0).click()
