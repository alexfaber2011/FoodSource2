Template.mapCanvas2.rendered = ->
  tmpl = this
  VazcoMaps.init {
    'sensor': true
    'key': 'AIzaSyBrdzL8BaRpow4R1SiU8HrPXxCc9Hu7lMM'
  }, ->
    tmpl.mapEngine = VazcoMaps.gMaps()
    tmpl.newMap2 = new tmpl.mapEngine(
      div: "#map-canvas2"
      lat: 43.0667
      lng: -89.4000
      zoom: 13
    )

#  $("#map-canvas2").css("min-height", $(window).height())


Template.mapCanvas2.helpers

Template.mapCanvas2.events