class SplashView
  
  constructor: (@famo) ->
    console.log('SplashView.new')
    @root = new famous.core.RenderNode()

    if !@initDone
      @addBack()
      # @addSlabs()
      @addButton()
      @initDone = true

    @show()

  addBack: () ->
    @bg = new famous.core.Surface({
      size:[250,250]
      content: "background"
      properties: {
        backgroundColor: "#ccc"
        zIndex: -20
      }
    })
    mod = new famous.core.Modifier({
      origin: [0, 0]
      align: [0, .2]
    })

    @root.add(mod).add(@bg)

    # @ctx.add(mod).add(@bg)

  addSlabs: () ->
    @surfaces = []
    @counter = 0

    for i in [1..10]
      @surfaces.push(
        new famous.core.Surface({
          content: "Surface: " + (i + 1)
          size: [100, 100]
          properties: {
            backgroundColor: "hsl(" + (i * 360 / 10) + ", 100%, 50%)"
            lineHeight: "200px"
            textAlign: 'center'
          }
        })
      )

    @famo.renderController.show(@surfaces[0])

    famous.core.Engine.on "click", () =>
      console.log("clicked", @counter)
      @next = (@counter++ + 1) % @surfaces.length
      @famo.renderController.show(@surfaces[@next])

    @mod = new famous.core.Modifier({
      origin: [0.5, 0.5]
      align: [0.5, 0.5]
    })


  addButton: () ->
    button = new famous.core.Surface({
      content: "chapterList"
      size: [100,100]
      properties: {
        backgroundColor: "#D44"
        content: "Button"
        zIndex: -1

      }
    })

    # Modder = require('famous/modifiers/StateModifier')
    Modder = famous.core.Modifier
    mod = new Modder({
      transform: famous.core.Transform.rotateZ(Math.PI/4)
      origin: [1, 0.5]
      align: [0.5, 1]
    })

    button.on 'click', =>
      console.log("clicked")
      Router.go("/chapters")

    # @famo.mainContext.add(mod).add(button)
    @root.add(mod).add(button)

  hide: () ->
    @famo.show(null)
    # @famo.renderController.hide()

  show: () ->
    console.log('splash.show')
    @famo.show(@root)
    # @famo.renderController.show(@surfaces[@counter])
