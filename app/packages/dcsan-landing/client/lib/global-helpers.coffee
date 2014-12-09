UI.registerHelper "asset", (path, alt) ->
  alt ?= path.split("/").pop()  # filename only

  s = ("<img src='/public/#{path}' alt='#{alt}' />")
  console.log(s)
  return s


UI.registerHelper "hl", (obj) ->
  console.log("hl", obj)
  return unless obj
  hl = Session.get('hl') or 'en'
  return obj[hl]

UI.registerHelper "tl", (obj) ->
  tl = Session.get('tl') or 'en'
  return obj[tl]
