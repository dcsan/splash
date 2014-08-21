class SpriteButton
  
  constructor: (@opts) ->
    console.log('SpriteButton.new')
    @root = new famous.core.RenderNode()

    @image = new famous.surfaces.ImageSurface({
      size: @opts.size  # since true doesn't work
      content: @opts.imageUrl
      classes: [@opts.imageClass]
      properties: {
        zIndex: @opts.zIndex or 100
      }
    })
    mod = new famous.core.Modifier({
      origin: @opts.origin
      align: @opts.align
      # size: @opts.size
    })
    @opts.parent.add(mod).add(@image)
