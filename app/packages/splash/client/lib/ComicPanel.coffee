class ComicPanel
  
  constructor: (@data, @idx) ->
    console.log('PanelSurface.new')
    @center = [0.5, 0.5]
    @root = new famous.core.View()

    @viewCrop = new famous.modifiers.StateModifier({
      size: [500, 500],
      origin: @center,
      align: @center,
      overflow: 'hidden'
    })

    @view = @root.add(@viewCrop)
    @addBack()
    @addTitle(@data)
    @addCaptions(@data.captions)
    @mainImage(@data)

  addBack: () ->
    @bg = new famous.core.Surface({
      size:[500,500]
      content: "panel"
      classes: ["comicPanelBack"]
    })
    mod = new famous.core.Modifier({
      origin: [0.5, 0.5]
      align: [0.5, 0.5]
    })
    @view.add(mod).add(@bg)

  addTitle: (obj) ->
    content = "<span class='panelTitle'>#{obj.title}</span>"
    @title = new famous.core.Surface({
      size: [undefined, 100]
      content: content
      properties: {
        zIndex: 100
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
      classes: ["comicPanelImage"]
    })
    mod = new famous.core.Modifier({
      origin: [0.5, 0.5]
      align: [0.5, 0.5]
    })
    @view.add(mod).add(@image)
    

