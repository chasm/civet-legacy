@Civet = Backbone.Router.extend
  routes:
    '':                 'showVitaes'
    'vitaes':           'showVitaes'
    'vitae/:id':        'showVitae'

  showVitaes: ->
    @showPage "/api/vitaes",
      Handlebars.templates.vitaes

  showVitae: (id) ->
    @showPage "/api/vitaes/#{id}",
      Handlebars.templates.vitae
    
  showPage: (url, tmplFunc) ->
    $.ajax url,
      type: 'GET'
      data: 'json'
      success: (data) ->
        $('#page-content').html(tmplFunc(data))
      error: (x,y,z) ->
        console.log x,y,z

$ ->
  console.log "routing", Backbone.history.start pushState: true, hashChange: false