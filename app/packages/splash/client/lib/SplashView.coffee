class SplashView
  
  constructor: (@famo, @data) ->
    console.log('SplashView.new')

    # famous verbose API
    @root = new famous.core.RenderNode()
    @view = new famous.core.View()
    @viewCrop = new famous.modifiers.StateModifier({
      size: [500, undefined],
      origin: @center,
      align: @center
    })
    @view = @root.add(@viewCrop)

    @panelCount = 4

    if !@initDone
      # @addBack()
      # @addSlabs()
      @scrollDirection = 1 # initial direction
      @addCarousel(@data)
      @addNavButton( 1, ">")
      @addNavButton(-1, "<")
      @initDone = true

    @logoIcon = new SpriteButton({
      imageUrl: "/images/ux/logo/logo.png"
      parent: @root
      origin: [1, 0]
      align: [1, 0]
      pos: [0,0,50]
      size: [200,150]
      zIndex: 50
    })

    @show()

  getData: () ->
    coverData = CoverData.find().fetch()

  addNavButton: (dir, label, img) ->
    button = new famous.core.Surface({
      size: [100,50]
      classes: ['panelNavButton']
      content: label
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

  hide: () ->
    @famo.show(null)
    # @famo.renderController.hide()

  show: () ->
    console.log('splash.show')
    @famo.show(@root)
    # @famo.renderController.show(@panels[@counter])

  getPanelNum:()->
    idx = @scrollview._node.index   #FIXME - may change?
    Session.set('panelPageNum', idx)
    return idx

  flipPage:(dir=null) ->
    @pageNum = @getPanelNum()
    console.log("flipPage dir:#{dir} 
      scrollDirection #{@scrollDirection} 
      pageNum: #{@pageNum}")

    # if @pageNum >= @panelCount
    #   @scrollDirection = -1
    # else if @pageNum <= 0
    #   @scrollDirection = 1

    if !dir
      dir = @scrollDirection

    if dir == 1
      @scrollview.goToNextPage()
    else
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
      console.log('data', obj)
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
      console.log('pageChange', p, e)

    #   if (pageNum >= @panelCount)
    #     @scrollDirection = - @scrollDirection
    #   console.log('pageChange', e, pageNum)

    # @slideshowContainer.on 'click', () =>
    #   @flipPage()

    callback = -> @flipPage
    Meteor.setTimeout(callback, 1000)
    
    # that = @
    # setTimeout =>
    #   @flipPage
    # , 500

