Meteor.startup ->
  if Meteor.isClient

    Router.map ->

      @route '/home',
        data: ->
          obj = {
            menuData: MenuData
            startUrl: "http://xgram.org"
            isLanding: false
          }
        action: ->
          colib.detectLanguage(@params.query)
          @render('landing')

      @route '/',
        data: ->
          obj = {
            menuData: MenuData
            startUrl: "http://xgram.org"
            isLanding: true
          }
          return obj

        action: ->
          colib.detectLanguage(@params.query)
          @render('landing')
