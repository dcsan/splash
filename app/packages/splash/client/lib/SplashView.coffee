class SplashView
  
  constructor: (@famo) ->
    console.log('SplashView.new')
    @root = new famous.core.RenderNode()

    if !@initDone
      # @addBack()
      # @addSlabs()
      @addButton()
      @addCarousel()
      @initDone = true

    $("body").css("background-image",
        "url(/images/ux/patterns/stripes/v-stripe.jpg)")

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
        backgroundColor: "#cFc"
        content: "Button"
        zIndex: 1
      }
    })

    # Modder = require('famous/modifiers/StateModifier')
    Modder = famous.core.Modifier
    mod = new Modder({
      origin: [0, 0.5]
      align: [0, .25]
      transform: famous.core.Transform.translate( 0, 50, 20)
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

  page:() ->
    console.log("page", @scrollview.currentPosition)
    @scrollview.goToNextPage()
    # setTimeout () =>
    #   @page
    # , 500

  addCarousel: () ->
    @scrollview = new famous.views.Scrollview({
      direction: 0
    })
    @surfaces = []

    @scrollview.sequenceFrom(@surfaces)

    @slideshowContainer = new famous.surfaces.ContainerSurface({
      properties: {
        overflow: 'hidden'
        boxShadow: "5px 5px 10px"
        size: [250, 250]
      }
    })

    for i in [1..20]
      temp = new famous.core.Surface({
        content: "Surface: #{i}"
        size: [300, 200],
        properties: {
          backgroundColor: "hsl(" + (i * 360 / 40) + ", 100%, 50%)",
          lineHeight: "200px",
          textAlign: "center"
        }
      })

      posmod = new famous.modifiers.StateModifier({
        origin: [0.5, 0],
        align: [0.5, 0],
        transform: famous.core.Transform.translate( 0, 100, 20)
      })

      temp.pipe(@scrollview)
      @surfaces.push(temp)

    @slideshowContainer.add(@scrollview)
    @root.add(posmod).add(@slideshowContainer)

    @slideshowContainer.on 'click', () =>
      console.log('scrollClick')
      @page()

    callback = -> @page
    Meteor.setTimeout(callback, 1000)
    
    # that = @
    # setTimeout =>
    #   @page
    # , 500

