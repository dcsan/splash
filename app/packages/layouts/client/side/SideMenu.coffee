## TODO - refactor into an object for hide/show methods


Template.SideMenu.hide = ->
  console.log('SideMenu.hide')
  @sideMenuVis = false
  $("#sideMenuOuter").hide()

  # $("#sideMenuOuter")
  #   .velocity({opacity: 0})


@sideMenuVis = false
Template.SideMenu.toggle = ->
  console.log('SideMenu.toggle')
  @sideMenuVis = ! @sideMenuVis
  if @sideMenuVis
    $("#sideMenuOuter").show()
    # $("#sideMenuOuter")
    #   .velocity({opacity: 1, display: block})
  else
    $("#sideMenuOuter").hide()
    # $("#sideMenuOuter")
    #   .velocity({opacity: 0, display: none})


Template.SideMenu.show = Template.SideMenu.toggle

Template.SideMenu.helpers

  hide: ->
    Template.SideMenu.hide()

    # $(".sideItem").velocity(
    #   "transition.slideLeftOut",
    #   {stagger: 50}
    # )
    # $(".sideMenuBack").hide()  # remove to skip events
    # $('#sideMenuOuter').velocity({ opacity: 0 } )


  show: ->
    Template.SideMenu.toggle()

  sideMenuItems: () ->
    [
      # {title: 'Chapter', url: eglib.getCurrentChapterUrl() }
      {title: 'Home', url: '/home', icon: 'fa-home' }
      {title: 'Study', url: '/lessons', icon: 'fa-graduation-cap' }
      {title: 'Play', url: '/lessons', icon: 'fa-trophy' }
      {title: 'Discuss', url: '/topics', icon: 'fa-database' }
      {title: 'Remember', url: '/deck', icon: 'fa-list-alt' }
      {title: 'Settings', url: '/settings', icon: 'fa-cog' }
    ]


Template.SideMenu.events

  "click .sideItem": (evt) ->
    evt.preventDefault()
    window.evt = evt
    url = $(evt.target).attr("url")
    console.log("sideMenu", evt)
    Template.SideMenu.hide()
    Router.go(url)

  "click #sideMenuBack": (evt) ->
    evt.preventDefault()
    Template.SideMenu.hide()

