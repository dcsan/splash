# Router.configure
#   layoutTemplate: "mobile"  # this is from the main app
#   trackPageView: true		# iron-router-ga dependency


if Meteor.isClient

  Router.map ->
    @route 'styleGuide',
      path: '/styleGuide'

  Router.map ->
    @route 'ComingSoon',
      path: '/ComingSoon'

  Router.map ->
    @route 'Locked',
      path: '/Locked'
