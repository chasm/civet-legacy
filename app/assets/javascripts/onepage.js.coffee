$ ->
  showVitaes = ->
    $.ajax
      url: '/api/vitaes'
      type: 'GET'
      data: 'json'
      success: (data) ->
        source = $("#vitaes-template").html()
        template = Handlebars.compile source
      
        $('#page-content').html template(data)
      error: (x,y,z) ->
        console.log x,y,z
        
  showVitae = (href) ->
    $.ajax
      url: href
      type: 'GET'
      data: 'json'
      success: (data) ->
        source = $("#vitae-template").html()
        template = Handlebars.compile source
        
        $('#page-content').html template(data)
      error: (x,y,z) ->
        console.log x,y,z
        
  $('#page-content').on 'click', 'ul.vitaes-link li a', (e) ->
    e.preventDefault()
    showVitae $(@).attr('href')
  
  $('#page-content').on 'click', 'p.vitaes-path a', (e) ->
    e.preventDefault()
    showVitaes()
        
  showVitaes()