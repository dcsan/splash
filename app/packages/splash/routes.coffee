# splash router

Meteor.startup ->

  if Meteor.isClient
    fob = new FamRender()

  Router.map ->

    @route 'splash',
      path: '/splash'

      onStop: ->
        console.log("IR.stop")
        FamRender.stop()

      # action: ->
        # console.log("hi", SplashView)
        # splash = new SplashView()
    
    @route 'settings',
      path: '/steps/1'
