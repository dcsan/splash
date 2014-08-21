Meteor.startup ->

  Router.map ->

    @route '/',
      action: ->
        Router.go('/splash')

    @route 'box',
      path: '/box'
      # action: Template.box.fam()

      data: {
        color: "red"
      }

