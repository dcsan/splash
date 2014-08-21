class SplashView
  
  constructor: (@famr) ->
    console.log('Splash.new')
    if !@initDone
      @draw()
      @initDone = true

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

    @famr.renderController.show(@surfaces[0])

    famous.core.Engine.on "click", () =>
      console.log("clicked", @counter)
      @next = (@counter++ + 1) % @surfaces.length
      @famr.renderController.show(@surfaces[@next])

    @mod = new famous.core.Modifier({
      origin: [.5, .5]
    })
      
    @famr.mainContext.add(@mod).add(@famr.renderController)

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

    @famr.mainContext.add(button)

  hide: () ->
    @famr.renderController.hide()

  show: () ->
    console.log('splash.show')
    @famr.renderController.show(@surfaces[@counter])
