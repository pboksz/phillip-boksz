$(document).on 'ready page:load', ->
  element = $('#travel-map')
  home = new google.maps.LatLng(50.0467656, 20.0048731)
  options =
    zoom: 3
    minZoom: 3
    center: home
    disableDefaultUI: true

  map = new google.maps.Map(element[0], options)
  $.each visitedLocations, (index, location) ->
    addMarker(map, location[0], location[1], location[2])

addMarker = (map, location, lat, lng) ->
  new google.maps.Marker
    map: map
    title: location
    position: new google.maps.LatLng(lat, lng)

visitedLocations =  [
  # North America
  ['New Jersey, USA', 40.1430058, -74.7311156]
  ['New York, USA,', 40.7033127, -73.979681]
  ['Pennsylvania, USA', 40.9945928, -77.6046984]
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
  ['Montreal, Quebec, Canada', 45.5601451, -73.7120832]
  ['Quebec, Quebec, Canada', 46.8580074, -71.3460728]
  ['Vancouver, British Columbia, Canada', 49.2569684, -123.1239135]
  ['Victoria, British Columbia, Canada', 48.4266797, -123.3584175]
  ['Puerto Plata, Dominican Republic', 19.7892025, -70.686083]

  # Europe
  ['Kraków, Poland', 50.0467656, 20.0048731]
  ['Warszawa, Poland', 52.232938, 21.0611941]
  ['Gdańsk, Poland', 54.3610873, 18.6900271]
  ['Poznan, Poland', 52.4005285, 16.9016658]
  ['Wrocław, Poland', 51.1270779, 16.9918639]
  ['Opoczno, Poland', 51.377272, 20.2747472]
  ['Stalowa Wola, Poland', 50.5661941, 22.0162866]
  ['Suwałki, Poland', 54.1027135, 22.9291278]
  ['Zambrów, Poland', 52.9761599, 22.2472449]
  ['Berlin, Germany', 52.5075419, 13.4251364]
  ['Paris, France', 48.8588589, 2.3470599]
  ['Nice, France', 43.7031905, 7.252817]
  ['Fontainebleau, France', 48.4235795, 2.6817304]
  ['Monaco', 43.7383229, 7.4244581]
  ['Barcelona, Spain', 41.39479, 2.1487679]
  ['London, England', 51.5286416,-0.1015987]
  ['Copenhagen, Denmark', 55.6712674, 12.5608388]
  ['Heviz, Hungary', 46.796554, 17.182532]
  ['Prague, Czech Republic', 50.0596696, 14.4656239]
  ['Dublin, Ireland', 53.3243201, -6.251695]
  ['Thessaloniki, Greece', 40.6211925, 22.9460273]
  ['Kallithea, Halkidiki, Greece', 40.0747065, 23.4457398]

  # Asia
  ['Hong Kong, China', 22.3700556, 114.1223784]
  ['Macau, China', 22.1634178, 113.5629425]
  ['Tokyo, Japan', 35.673343, 139.710388]
]

