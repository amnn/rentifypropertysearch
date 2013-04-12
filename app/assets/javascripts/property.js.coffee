# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ -> 
    $('#search').keyup( (e) ->
        sendQuery( this.value ) if e.which == 13 )

    geocoder = new google.maps.Geocoder()

    $('.property-list li').each (i,e) ->
        strLatLng =         $( this ).children(    "input.prop-latlng" ).
                                           first().val().split( ',', 2 )

        latLng    = new google.maps.LatLng( parseFloat( strLatLng[0] ), 
                                            parseFloat( strLatLng[1] ) )

        geocoder.geocode { 'latLng': latLng }, (res, status) =>
            $(this).append( addr res ) if status == 'OK'



sendQuery = (query) -> window.location = "/search/" + query

addr      = (res) ->
    address = res[0].formatted_address
    return "" if !address?

    "<p class='muted'><small>#{address}</small></p>"

