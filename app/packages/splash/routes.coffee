# splash router

Meteor.startup ->

  Router.map ->

    @route 'splash',
      path: '/splash'

      # action: ->
        # console.log("hi", SplashView)
        # splash = new SplashView()
    
    @route 'settings',
      path: '/steps/1'
