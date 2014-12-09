Meteor.startup ->
  if Meteor.isClient

    Router.map ->

      @route '/landing',
        
        data: ->
          return {
            menuItems: MenuData
          }

        action: ->
          colib.detectLanguage(@params.query)
          @render('landing')
