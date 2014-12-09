Meteor.startup ->
  if Meteor.isClient

    Router.map ->

      @route '/',
        
        data: ->
          return {
            menuItems: MenuData
          }

        action: ->
          colib.detectLanguage(@params.query)
          @render('landing')
