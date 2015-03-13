$(document).on 'ready page:load', ->
  element = $('#travel-map')
  home = new google.maps.LatLng(50.0596025, 19.9507136)
  options =
    zoom: 3
    minZoom: 3
    center: home

  map = new google.maps.Map(element[0], options)
  $.each visitedLocations, (index, location) ->
    marker = addMarker(map, location[1], location[2])

addMarker = (map, lat, lng) ->
  new google.maps.Marker
    map: map
    position: new google.maps.LatLng(lat, lng)

visitedLocations =  [
  # United States
  ['New Jersey, USA', 40.1430058, -74.7311156],
  ['New York, USA,', 40.7033127, -73.979681],
  ['Pennsylvania, USA', 40.9945928, -77.6046984],
  ['Massachusetts, USA', 42.0629399, -71.7183465]
  ['Rhode Island, USA', 41.5827282, -71.5064508]
  ['Connecticut, USA', 41.5187836, -72.757507]
  ['Maine, USA', 45.2171892, -69.0170786]
  ['Vermont, USA', 43.8717545, -72.4477828]
  ['New Hampshire, USA', 44.0012306, -71.5799205]
  ['Maryland, USA', 38.8063524, -77.2684162]
  ['Washington DC, USA', 38.8993487, -77.0145665]
  ['North Carolina, USA', 35.2145629, -79.8912675]
  ['Florida, USA', 27.762143, -83.8330166]
  ['Arizona, USA', 34.1682185, -111.930907]
  ['Nevada, USA', 38.502032, -117.0230604]
  ['California, USA', 37.2718745, -119.2704153]
  ['Washington, USA', 47.2755146, -120.8506483]
  ['Colorado, USA', 38.9979339, -105.550567]
  # Canada
  ['Montreal, Quebec, Canada', 45.5601451, -73.7120832],
  ['Quebec, Quebec, Canada', 46.8580074, -71.3460728],
  ['Vancouver, British Columbia, Canada', 49.2569684, -123.1239135],
  ['Victoria, British Columbia, Canada', 48.4266797, -123.3584175],
  # Carribean
  ['Puerto Plata, Dominican Republic', 19.7892025, -70.686083],
  # Europe
  # Asia
]

