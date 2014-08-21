initDone = false
splash = null

Template.splash.rendered = () ->
  console.log('Template.splash.rendered')
  if !initDone
    splash = new SplashView(FamRender.one)
    window.g = splash
    window.fob = FamRender.one
    initDone = true
  else
    splash.show()
