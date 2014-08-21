# one central famous render object
# singleton-ish with FamRender.one

class FamRender
  
  one: null

  constructor: (opts) ->
    console.log('FamRender.new')
    if !@initDone
      @init(opts)
      FamRender.one = @  # singleton
      @initDone = true

  init: (opts={}) ->
    console.log("FamRender.init")
    # debugger;
    # Rig some famo.us deps
    Engine = require('famous/core/Engine')
    Engine.setOptions({appMode: false})
    famous.polyfills
    famous.core.famous

    opts = _.extend(opts, {
      appMode: false
    })
    console.log('opts', opts)

    # famDiv = window.document.getElementById(opts.div)
    # if !famDiv
    #   console.warn("couldnt find div to init famous:", opts.div)

    @mainContext = famous.core.Engine.createContext()
    @renderController = new famous.views.RenderController()

    # @ren = @famr.renderController
    # @ctx = @famr.mainContext
    @mainContext.add(@renderController)


  show: (node) ->
    @renderController.show(node)
    FamRender.enable()

  hide: ()->
    @renderController.show(null)
    FamRender.disable()

FamRender.stop = () ->
  FamRender.one.hide()

FamRender.disable = ()->
  $("body").css("overflow", "visible")

FamRender.enable = ()->
  $("body").css("overflow", "hidden")
