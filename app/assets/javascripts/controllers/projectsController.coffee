$ ->
  $('.move a').on 'click', (event) ->
    event.preventDefault()
    nextProject = $($(event.currentTarget).attr('href'))
    $('html, body').animate { scrollTop: nextProject.offset().top }, 600, ->
      nextProject.focus()

  window.addEventListener 'mousewheel', (event) ->
    project = $(event.srcElement).closest('.project')
    if project
      if event.wheelDelta > 0 # mouse wheel up
        prevProject(project)
      else if event.wheelDelta < 0 # mouse wheel down
        nextProject(project)

  $('.project').keydown (event) ->
    project = $(event.currentTarget).closest('.project')
    if project
      if event.which == 38 # up arrow
        prevProject(project)
      else if event.which == 40 # down arrow
        nextProject(project)

prevProject = (project) ->
  project.find('.move .prev').get(0).click()

nextProject = (project) ->
  project.find('.move .next').get(0).click()
