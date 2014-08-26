class SplashView
  
  constructor: (@famo, @data) ->
    @log('SplashView.new')

    # famous verbose API
    @root = new famous.core.RenderNode()
    @view = new famous.core.View()

    # prevent outside from messing with scrollH
    @viewCrop = new famous.modifiers.StateModifier({
      size: [500, undefined],
      origin: @center,
      align: @center
      overflow: 'hidden'
    })
    @view = @root.add(@viewCrop)

    @panelCount = @data.length

    if !@initDone
      # @addBack()
      # @addSlabs()
      @scrollDirection = 1 # initial direction
      @addCarousel(@data)
      @addNavButton( 1, "/images/ux/icons/128/arrow-right.png")
      @addNavButton(-1, "/images/ux/icons/128/arrow-left.png")
      @initDone = true

    @addLogo()
    @show()

  addLogo: () ->
    @logoIcon = new SpriteButton({
      imageUrl: "/images/ux/logo/logo.png"
      parent: @root
      origin: [1, 0]
      align: [1, 0]
      pos: [0,0,50]
      size: [200,150]
      zIndex: 50
    })

  # getData: () ->
  #   coverData = CoverData.find().fetch()

  addNavButton: (dir, imgSrc) ->
    button = new famous.surfaces.ImageSurface({
      size: [64, 64]
      classes: ['panelNavButton']
      content: imgSrc
      properties: {
        # borderRadius: "50%"
      }
    })

    if (dir==1) # right
      opts = {
        origin: [ 1, 0.5]
        align:  [ 1, 0.5]
      }
    else # left
      opts = {
        origin: [0, 0.5]
        align:  [0 ,0.5]
      }

    mod = new famous.core.Modifier(opts)

    # @famo.mainContext.add(mod).add(button)
    @view.add(mod).add(button)
    button.on 'click', =>
      console.group("clicked", dir)
      @flipPage(dir)
      console.groupEnd()
      # Router.go("/chapters")

  # enable logging toggle
  log: (a,b) ->
    console.log(a, b)

  hide: () ->
    @famo.show(null)
    # @famo.renderController.hide()

  show: () ->
    @log('splash.show')
    @famo.show(@root)
    # @famo.renderController.show(@panels[@counter])

  getPanelNum: ()->
    idx = @scrollview._node.index   #FIXME - may change?
    Session.set('panelPageNum', idx)
    return idx

  flipPage: (dir=null) ->
    @pageNum = @getPanelNum()
    @log("flipPage dir:#{dir}
      scrollDirection #{@scrollDirection}
      pageNum: #{@pageNum}")

    if @pageNum >= (@panelCount-1)   # zero indexed
      @scrollDirection = -1
      @log("flipDir max", @scrollDirection)
    else if @pageNum <= 0
      @scrollDirection = 1
      @log("flipDir min", @scrollDirection)

    if dir==null or dir=="auto"
      dir = @scrollDirection
      @log("autodir", dir)

    if dir == 1
      @scrollview.goToNextPage()
    else
      # debugger
      @scrollview.goToPreviousPage()

    # setTimeout () =>
    #   @flipPage
    # , 500

  addCarousel: (data) ->
    @scrollview = new famous.views.Scrollview({
      direction: 0
      paginated: true
    })

    # overflow crop it
    @slideshowContainer = new famous.surfaces.ContainerSurface({
      properties: {
        overflow: 'hidden'
        size: [500, 500]  # forced size since "true" is a mess
      }
    })

    @panels = []

    # for i in [0..10]
    for obj, idx in data
      @log('data', obj)
      panel = new ComicPanel(obj, idx)
      panel.image.pipe(@scrollview)
      @panels.push(panel.view)

    # debugger;

    posmod = new famous.modifiers.StateModifier({
      origin: [0.5, 0.5],
      align: [0.5, 0.4],
      # transform: famous.core.Transform.translate( 0, 100, 20)
    })

    @scrollview.sequenceFrom(@panels)

    @slideshowContainer.add(@scrollview)
    @root.add(posmod).add(@slideshowContainer)
    # @root.add(@slideshowContainer)

    @scrollview.on 'pageChange', (e) =>
      p = @getPanelNum()
      @log('pageChange', p, e)

    that = this
    @slideshowContainer.on 'click', () ->
      that.flipPage("auto")

    Meteor.setTimeout (=> @flipPage), 1000
    
    # that = @
    # setTimeout =>
    #   @flipPage
    # , 500

