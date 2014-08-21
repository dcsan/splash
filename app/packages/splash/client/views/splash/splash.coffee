initDone = false
splash = null

Template.splash.rendered = () ->
  console.log('Template.splash.rendered')
  if !initDone
    coverData = CoverData.find()
    splash = new SplashView(FamRender.one, coverData)
    window.g = splash
    window.fob = FamRender.one
    initDone = true
  else
    splash.show()

Template.splash.panelPageNum = () ->
  return Session.get('panelPageNum')
