@Civet = Backbone.Router.extend
  routes:
    '':                 'showVitaes'
    'vitaes':           'showVitaes'
    'vitae/:id':        'showVitae'

  showVitaes: ->
    @showPage "/api/vitaes",
      HandlebarsTemplates['vitaes']

  showVitae: (id) ->
    @showPage "/api/vitaes/#{id}",
      HandlebarsTemplates['vitae']

  showPage: (url, tmplFunc) ->
    $.ajax url,
      type: 'GET'
      data: 'json'
      success: (data) ->
        console.log data
        console.log tmplFunc(data)
        $('#page-content').html(tmplFunc(data))
      error: (x,y,z) ->
        console.log x,y,z

$ ->
  new Civet()
  console.log "routing", Backbone.history.start pushState: true, hashChange: false