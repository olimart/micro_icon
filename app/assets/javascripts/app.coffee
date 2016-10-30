ready = ->
  App =
    beforeCreate: ->
      for i in [VueResource]
        Vue.use i
        Vue.config.devtools = true
        # Vue.http.options.root = 'http://localhost:3008';

        Vue.component 'icon',
          props:
            path: String
            size:
              default: 16
            color:
              default: 'currentColor'
          template: '<svg :width=size :height=size viewBox="0 0 24 24"><path :fill=color :d=path></path></svg>'

        new Vue
          el: "#app"

          mounted: ->
            @getPaths()

          data:
            size: 34
            backgroundColor: "#7fdbff"
            color: "#001f3f" # '111'
            icons: []

          methods:
            getPaths: ->
              url = '/paths.json/'
              @$http.get(url).then ((response) ->
                @$set @, 'icons', response.body # response.body
              ), (response, status, request) ->
                console.log status + ' - ' + request

  # Inititalize main component
  new App.beforeCreate

$(document).ready(ready)
