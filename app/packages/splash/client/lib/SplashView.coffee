class SplashView
  
  constructor: () ->
    console.log('Splash.new')
    if !@initDone
      @init()
      @draw()

  init: () ->
    # Rig some famo.us deps
    Engine = require('famous/core/Engine')
    Engine.setOptions({appMode: false})
    famous.polyfills
    famous.core.famous

    opts = {
      appMode: false
    }

    famDiv = window.document.getElementById("famDiv")
    @mainContext = famous.core.Engine.createContext(famDiv)
    @renderController = new famous.views.RenderController()

  draw: () ->
    @surfaces = []
    @counter = 0

    for i in [1..10]
      @surfaces.push(
        new famous.core.Surface({
          content: "Surface: " + (i + 1)
          size: [200, 200]
          properties: {
            backgroundColor: "hsl(" + (i * 360 / 10) + ", 100%, 50%)"
            lineHeight: "200px"
            textAlign: 'center'
          }
        })
      )

    @renderController.show(@surfaces[0])

    famous.core.Engine.on "click", () =>
      console.log("clicked", @counter)
      next = (@counter++ + 1) % @surfaces.length
      @renderController.show(@surfaces[next])

    @mod = new famous.core.Modifier({
      origin: [.5, .5]
    })
      
    @mainContext.add(@mod).add(@renderController)

    @addButton()

  addButton: () ->
    button = new famous.core.Surface({
      content: "chapterList"
      size: [200,50]
      properties: {
        backgroundColor: "#0F0"
      }
    })

    button.on 'click', =>
      console.log("clicked")
      Router.go("/chapters")

    @mainContext.add(button)
