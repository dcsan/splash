initDone = false
splash = null
famr = null

Template.splash.rendered = () ->
  console.log('splash.rendered')
  opts = {
    div: "famDiv"
  }
  if initDone
    splash.show()
  else
    famr = new FamRender(opts)
    splash = new SplashView(famr)
    window.g = splash
    initDone = true
