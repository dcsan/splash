# one central famous render object

class FamRender
  
  constructor: (opts) ->
    console.log('Splash.new')
    if !@initDone
      @init(opts)
      @initDone = true

  init: (opts) ->
    # Rig some famo.us deps
    Engine = require('famous/core/Engine')
    Engine.setOptions({appMode: false})
    famous.polyfills
    famous.core.famous

    opts = _.extend(opts, {
      appMode: false
    })
    console.log('opts', opts)

    famDiv = window.document.getElementById(opts.div)
    if !famDiv
      console.warn("couldnt find div to init famous:", opts.div)
    @mainContext = famous.core.Engine.createContext(famDiv)
    @renderController = new famous.views.RenderController()

