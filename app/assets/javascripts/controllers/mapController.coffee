$(document).on 'ready page:load', ->
  element = $('#travel-map')
  if element.length > 0
    home = new google.maps.LatLng(50.0467656, 20.0048731)
    options =
      zoom: 3
      minZoom: 3
      center: home
      disableDefaultUI: true

    map = new google.maps.Map(element[0], options)
    $.each Location.all(), (index, location) ->
      marker = addMarker(map, location[0], location[1], location[2])
      tooltip = addTooltip(map, marker, location[0])
      addEventListeners(map, marker, tooltip)

addMarker = (map, location, lat, lng) ->
  new google.maps.Marker
    map: map
    title: location
    position: new google.maps.LatLng(lat, lng)

addTooltip = (map, marker, location) ->
  new google.maps.InfoWindow
    content: location

addEventListeners = (map, marker, tooltip) ->
  google.maps.event.addListener marker, 'click', ->
    tooltip.open(map, marker)
  google.maps.event.addListener map, 'click', ->
    tooltip.close()
