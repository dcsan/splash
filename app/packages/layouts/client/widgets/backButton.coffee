Template.backButton.events
  'click #backButton': (e) ->
    href = $(e.target).attr("href")
    if href
      Router.go(href)
    else
      history.back()

