
famup = () ->
  
  # Rig some famo.us deps
  famous.polyfills
  famous.core.famous
  
  # Make sure dom got a body...
  Meteor.startup ->
    mainContext = famous.core.Engine.createContext()
    renderController = new famous.views.RenderController()
    surfaces = []
    counter = 0
    i = 0

    while i < 10
      surfaces.push new famous.core.Surface(
        content: "Surface: " + (i + 1)
        size: [
          200
          200
        ]
        properties:
          backgroundColor: "hsl(" + (i * 360 / 10) + ", 100%, 50%)"
          lineHeight: "200px"
          textAlign: "center"
      )
      i++
    renderController.show surfaces[0]
    famous.core.Engine.on "click", (->
      next = (counter++ + 1) % surfaces.length
      @show surfaces[next]
      return
    ).bind(renderController)
    mainContext.add(new famous.core.Modifier(origin: [
      .5
      .5
    ])).add renderController
    return

  return

Template.box.fam = () ->
  famup()
