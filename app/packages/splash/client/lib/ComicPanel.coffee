class ComicPanel
  
  constructor: (@data, @idx) ->
    console.log('PanelSurface.new')

    @center = [0.5, 0.5]

    # @root = new famous.core.RenderNode({
    #   size: [500,500]
    # })

    # @view = new famous.modifiers.StateModifier({
    #   size: [450, 450],
    #   # origin: origin,
    #   # align: align
    # })

    @root = new famous.core.View()

    # @surf = new famous.core.Surface({
    #   size: [400, 400]
    #   properties: {
    #     backgroundColor: '#FA5C4F'
    #   }
    # })

    @viewCrop = new famous.modifiers.StateModifier({
      size: [500, 500],
      origin: @center,
      align: @center
    })

    @view = @root.add(@viewCrop)
    @addBack()
    @addTitle(@data)
    @addCaptions(@data.captions)
    @mainImage(@data)

  addBack: () ->
    @bg = new famous.core.Surface({
      size:[450,450]
      content: "panel"
      classes: ["comicPanelBack"]
    })
    mod = new famous.core.Modifier({
      origin: [0.5, 0.5]
      align: [0.5, 0.5]
    })
    @view.add(mod).add(@bg)
    # @root.add(mod).add(@bg)
    # @root.add(mod).add(@bg)

  addTitle: (obj) ->
    content = "<span class='panelTitle'>#{obj.title}</span>"
    @title = new famous.core.Surface({
      size: [undefined, true]
      content: content
      properties: {
        zIndex: 20
      }
    })
    mod = new famous.core.Modifier({
      align: [0.05, 0.05]
      origin: [0, 0]
    })
    @view.add(mod).add(@title)


  addCaptions: (captions) ->
    content = ""
    ## line breaks after spans
    for cap in captions
      content += "<span class='comicPanelCaption'>#{cap.text}</span><br/>"
    @caption = new famous.core.Surface({
      size: [450, true]
      content: content
      properties: {
        zIndex: 20
      }
    })
    mod = new famous.core.Modifier({
      align:  [0.05, 1]
      origin: [0, 1]
    })
    @view.add(mod).add(@caption)

  mainImage: (obj) ->
    @image = new famous.surfaces.ImageSurface({
      size:[400, true]
      content: obj.image
      classes: [obj.imageClass]
    })
    mod = new famous.core.Modifier({
      origin: [0.5, 0.5]
      align: [0.5, 0.5]
    })
    @view.add(mod).add(@image)
    


  # addSlabs: () ->
  #   @surfaces = []
  #   @counter = 0

  #   for i in [1..10]
  #     @surfaces.push(
  #       new famous.core.Surface({
  #         content: "Surface: " + (i + 1)
  #         size: [100, 100]
  #         properties: {
  #           backgroundColor: "hsl(" + (i * 360 / 10) + ", 100%, 50%)"
  #           lineHeight: "200px"
  #           textAlign: 'center'
  #         }
  #       })
  #     )

  #   @famo.renderController.show(@surfaces[0])

  #   famous.core.Engine.on "click", () =>
  #     console.log("clicked", @counter)
  #     @next = (@counter++ + 1) % @surfaces.length
  #     @famo.renderController.show(@surfaces[@next])

  #   @mod = new famous.core.Modifier({
  #     origin: [0.5, 0.5]
  #     align: [0.5, 0.5]
  #   })


  # addButton: () ->
  #   button = new famous.core.Surface({
  #     content: "chapterList"
  #     size: [100,100]
  #     properties: {
  #       backgroundColor: "#cFc"
  #       content: "Button"
  #       zIndex: 1
  #     }
  #   })

  #   # Modder = require('famous/modifiers/StateModifier')
  #   Modder = famous.core.Modifier
  #   mod = new Modder({
  #     origin: [0, 0.5]
  #     align: [0, .25]
  #     transform: famous.core.Transform.translate( 0, 50, 20)
  #   })

  #   button.on 'click', =>
  #     console.log("clicked")
  #     Router.go("/chapters")

  #   # @famo.mainContext.add(mod).add(button)
  #   @root.add(mod).add(button)

  # hide: () ->
  #   @famo.show(null)
  #   # @famo.renderController.hide()

  # show: () ->
  #   console.log('splash.show')
  #   @famo.show(@root)
  #   # @famo.renderController.show(@surfaces[@counter])

  # page:() ->
  #   console.log("page", @scrollview.currentPosition)
  #   @scrollview.goToNextPage()
  #   # setTimeout () =>
  #   #   @page
  #   # , 500

  # addCarousel: () ->
  #   @scrollview = new famous.views.Scrollview({
  #     direction: 0
  #     paginated: true
  #   })
  #   @surfaces = []

  #   @slideshowContainer = new famous.surfaces.ContainerSurface({
  #     properties: {
  #       overflow: 'hidden'
  #       boxShadow: "5px 5px 10px"
  #       size: [250, 200]
  #       properties: {
  #         backgroundColor: "#666"
  #       }
  #     }
  #   })

  #   for i in [0..10]
  #     temp = new famous.core.Surface({
  #       content: "Surface: #{i}"
  #       size: [300, 200],
  #       properties: {
  #         backgroundColor: "hsl(" + (i * 360 / 40) + ", 100%, 50%)",
  #         lineHeight: "200px",
  #         textAlign: "center"
  #       }
  #     })

  #     temp.pipe(@scrollview)
  #     @surfaces.push(temp)

  #   posmod = new famous.modifiers.StateModifier({
  #     origin: [0.5, 0],
  #     align: [0.5, 0],
  #     transform: famous.core.Transform.translate( 0, 100, 20)
  #   })

  #   @scrollview.sequenceFrom(@surfaces)

  #   @slideshowContainer.add(@scrollview)
  #   @root.add(posmod).add(@slideshowContainer)

  #   @scrollview.on 'pageChange', (e) =>
  #     pageNum = @scrollview._node.index
  #     console.log('pageChange', e, pageNum)

  #   @slideshowContainer.on 'click', () =>
  #     @page()

  #   callback = -> @page
  #   Meteor.setTimeout(callback, 1000)
    
  #   # that = @
  #   # setTimeout =>
  #   #   @page
  #   # , 500

