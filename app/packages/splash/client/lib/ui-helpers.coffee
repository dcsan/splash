UI.registerHelper "trans", (wot, lang2=null) ->
  lang2 ?= Session.get('lang2')
  console.log("trans")

  ## TODO
  # val = Translations.get(wot, lang2) or wot

  return wot

