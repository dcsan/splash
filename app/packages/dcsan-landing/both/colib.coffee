colib = {}

Meteor.startup ->

  if Meteor.isClient
    
    colib.detectLanguage = (opts) ->
      unless opts
        console.error("detectLanguage needs opts")
        return

      console.log("opts", opts)

      hl = opts.hl or 'en'
      tl = opts.tl or 'en'

      Session.set('hl', hl)
      Session.set('tl', tl)
